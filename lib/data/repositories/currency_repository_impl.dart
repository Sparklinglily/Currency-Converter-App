import 'package:currency_converter/core/errors/failure.dart';
import 'package:currency_converter/data/apiservice/currency_apiservice.dart';
import 'package:currency_converter/domain/entities/currency.dart';
import 'package:currency_converter/domain/entities/exchange.dart';
import 'package:currency_converter/domain/repository/currency_repository.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyApiService apiService;

  CurrencyRepositoryImpl({required this.apiService});

  @override
  Future<(List<Currency>?, Failure?)> getCurrencies() async {
    try {
      final currencyModels = await apiService.getCurrencies();
      //converting currency model to Currency via mapping, an important fix to avoid type mismatch issue
      final currencies =
          currencyModels
              .map((model) => Currency(code: model.code, name: model.name))
              .toList();
      return (currencies, null);
    } on Failure catch (failure) {
      return (null, failure);
    } catch (e) {
      return (null, UnknownFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<(ExchangeRate?, Failure?)> getExchangeRate(
    String from,
    String to,
  ) async {
    try {
      final exchangeRate = await apiService.getExchangeRate(from, to);
      return (exchangeRate, null);
    } on Failure catch (failure) {
      return (null, failure);
    } catch (e) {
      return (null, UnknownFailure('Unexpected error: $e'));
    }
  }
}
