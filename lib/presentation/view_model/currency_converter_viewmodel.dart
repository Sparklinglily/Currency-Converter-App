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

  const CurrencyConverterState({
    this.currencies = const [],
    this.fromCurrency,
    this.toCurrency,
    this.amount = 1.0,
    this.convertedAmount = 0.0,
    this.isLoading = false,
    this.errorMessage,
    this.currentRate,
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

      convert();
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage: failure?.message ?? 'Failed to load currencies',
      );
    }
  }

  void setFromCurrency(Currency currency) {
    state = state.copyWith(fromCurrency: currency);
    convert();
  }

  void setToCurrency(Currency currency) {
    state = state.copyWith(toCurrency: currency);
    convert();
  }

  void setAmount(double amount) {
    state = state.copyWith(amount: amount);
    convert();
  }

  void swapCurrencies() {
    final from = state.fromCurrency;
    final to = state.toCurrency;

    if (from != null && to != null) {
      state = state.copyWith(fromCurrency: to, toCurrency: from);
      convert();
    }
  }

  Future<void> convert() async {
    final from = state.fromCurrency;
    final to = state.toCurrency;

    if (from == null || to == null || from.code == to.code) return;

    state = state.copyWith(isLoading: true, errorMessage: null);

    final (exchangeRate, failure) = await convertCurrency(from.code, to.code);

    if (exchangeRate != null) {
      final converted = exchangeRate.convert(state.amount);
      state = state.copyWith(
        convertedAmount: converted,
        currentRate: exchangeRate,
        isLoading: false,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage: failure?.message ?? 'Failed to convert currency',
      );
    }
  }
}
