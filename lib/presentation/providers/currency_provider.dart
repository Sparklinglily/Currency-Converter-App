import 'package:currency_converter/data/apiservice/currency_apiservice.dart';
import 'package:currency_converter/data/repositories/currency_repository_impl.dart';
import 'package:currency_converter/domain/repository/currency_repository.dart';
import 'package:currency_converter/domain/use_cases/convert_currency.dart';
import 'package:currency_converter/domain/use_cases/get_currency.dart';
import 'package:currency_converter/presentation/view_model/currency_converter_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final httpClientProvider = Provider<http.Client>((ref) {
  return http.Client();
});

final currencyApiServiceProvider = Provider<CurrencyApiService>((ref) {
  return CurrencyApiServiceImpl(client: ref.watch(httpClientProvider));
});

final currencyRepositoryProvider = Provider<CurrencyRepository>((ref) {
  return CurrencyRepositoryImpl(
    apiService: ref.watch(currencyApiServiceProvider),
  );
});

final getCurrenciesProvider = Provider<GetCurrencies>((ref) {
  return GetCurrencies(ref.watch(currencyRepositoryProvider));
});

final convertCurrencyProvider = Provider<ConvertCurrency>((ref) {
  return ConvertCurrency(ref.watch(currencyRepositoryProvider));
});

final currencyConverterViewModelProvider =
    StateNotifierProvider<CurrencyConverterViewModel, CurrencyConverterState>((
      ref,
    ) {
      return CurrencyConverterViewModel(
        getCurrencies: ref.watch(getCurrenciesProvider),
        convertCurrency: ref.watch(convertCurrencyProvider),
      );
    });
