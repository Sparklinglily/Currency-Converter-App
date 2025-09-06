import 'package:currency_converter/core/errors/failure.dart';
import 'package:currency_converter/domain/entities/currency.dart';
import 'package:currency_converter/domain/entities/exchange.dart';

abstract class CurrencyRepository {
  Future<(List<Currency>?, Failure?)> getCurrencies();
  Future<(ExchangeRate?, Failure?)> getExchangeRate(String from, String to);
}
