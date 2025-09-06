import 'package:currency_converter/core/errors/failure.dart';
import 'package:currency_converter/domain/entities/currency.dart';
import 'package:currency_converter/domain/repository/currency_repository.dart';

class GetCurrencies {
  final CurrencyRepository repository;

  GetCurrencies(this.repository);

  Future<(List<Currency>?, Failure?)> call() async {
    return await repository.getCurrencies();
  }
}
