import 'package:currency_converter/core/errors/failure.dart';
import 'package:currency_converter/domain/entities/exchange.dart';
import 'package:currency_converter/domain/repository/currency_repository.dart';

class ConvertCurrency {
  final CurrencyRepository repository;

  ConvertCurrency(this.repository);

  Future<(ExchangeRate?, Failure?)> call(String from, String to) async {
    return await repository.getExchangeRate(from, to);
  }
}
