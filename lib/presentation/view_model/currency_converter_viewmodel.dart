import 'package:currency_converter/domain/entities/currency.dart';
import 'package:currency_converter/domain/entities/exchange.dart';
import 'package:currency_converter/domain/use_cases/convert_currency.dart';
import 'package:currency_converter/domain/use_cases/get_currency.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencyConverterState {
  final List<Currency> currencies;
  final Currency? fromCurrency;
  final Currency? toCurrency;
  final double amount;
  final double convertedAmount;
  final bool isLoading;
  final String? errorMessage;
  final ExchangeRate? currentRate;
  final Map<String, ExchangeRate> cachedRates;

  const CurrencyConverterState({
    this.currencies = const [],
    this.fromCurrency,
    this.toCurrency,
    this.amount = 1.0,
    this.convertedAmount = 0.0,
    this.isLoading = false,
    this.errorMessage,
    this.currentRate,
    this.cachedRates = const {},
  });

  CurrencyConverterState copyWith({
    List<Currency>? currencies,
    Currency? fromCurrency,
    Currency? toCurrency,
    double? amount,
    double? convertedAmount,
    bool? isLoading,
    String? errorMessage,
    ExchangeRate? currentRate,
    Map<String, ExchangeRate>? cachedRates,
  }) {
    return CurrencyConverterState(
      currencies: currencies ?? this.currencies,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
      amount: amount ?? this.amount,
      convertedAmount: convertedAmount ?? this.convertedAmount,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      currentRate: currentRate ?? this.currentRate,
      cachedRates: cachedRates ?? this.cachedRates,
    );
  }
}

class CurrencyConverterViewModel extends StateNotifier<CurrencyConverterState> {
  final GetCurrencies getCurrencies;
  final ConvertCurrency convertCurrency;

  CurrencyConverterViewModel({
    required this.getCurrencies,
    required this.convertCurrency,
  }) : super(const CurrencyConverterState()) {
    loadCurrencies();
  }

  Future<void> loadCurrencies() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final (currencies, failure) = await getCurrencies();

    if (currencies != null) {
      final sdg = currencies.firstWhere(
        (c) => c.code == 'SDG',
        orElse: () => currencies.first,
      );
      final usd = currencies.firstWhere(
        (c) => c.code == 'USD',
        orElse: () => currencies.last,
      );

      state = state.copyWith(
        currencies: currencies,
        fromCurrency: sdg,
        toCurrency: usd,
        isLoading: false,
      );

      await _fetchExchangeRate();
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage: failure?.message ?? 'Failed to load currencies',
      );
    }
  }

  void setFromCurrency(Currency currency) {
    state = state.copyWith(fromCurrency: currency);
    _fetchExchangeRate();
  }

  void setToCurrency(Currency currency) {
    state = state.copyWith(toCurrency: currency);
    _fetchExchangeRate();
  }

  void setAmount(double amount) {
    state = state.copyWith(amount: amount);
    _calculateConversion();
  }

  void swapCurrencies() {
    final from = state.fromCurrency;
    final to = state.toCurrency;

    if (from != null && to != null) {
      state = state.copyWith(fromCurrency: to, toCurrency: from);
      _fetchExchangeRate();
    }
  }

  void _calculateConversion() {
    final rate = state.currentRate;
    if (rate != null) {
      final converted = rate.convert(state.amount);
      state = state.copyWith(convertedAmount: converted);
    }
  }

  Future<void> _fetchExchangeRate() async {
    final from = state.fromCurrency;
    final to = state.toCurrency;

    if (from == null || to == null) return;

    if (from.code == to.code) {
      final sameRate = ExchangeRate(
        baseCode: from.code,
        targetCode: to.code,
        rate: 1.0,
        lastUpdate: DateTime.now(),
      );

      state = state.copyWith(
        currentRate: sameRate,
        convertedAmount: state.amount,
      );
      return;
    }
    final cacheKey = '${from.code}-${to.code}';
    final cachedRate = state.cachedRates[cacheKey];

    if (cachedRate != null &&
        DateTime.now().difference(cachedRate.lastUpdate).inMinutes < 5) {
      state = state.copyWith(currentRate: cachedRate);
      _calculateConversion();
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    final (exchangeRate, failure) = await convertCurrency(from.code, to.code);

    if (exchangeRate != null) {
      final newCache = Map<String, ExchangeRate>.from(state.cachedRates);
      newCache[cacheKey] = exchangeRate;

      state = state.copyWith(
        currentRate: exchangeRate,
        cachedRates: newCache,
        isLoading: false,
      );

      _calculateConversion();
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage: failure?.message ?? 'Failed to get exchange rate',
      );
    }
  }

  Future<void> refreshRates() async {
    state = state.copyWith(cachedRates: {});
    await _fetchExchangeRate();
  }
}
