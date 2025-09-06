import 'package:currency_converter/domain/entities/currency.dart';

class CurrencyModel extends Currency {
  const CurrencyModel({required super.code, required super.name});

  factory CurrencyModel.fromJson(List<dynamic> json) {
    return CurrencyModel(code: json[0] as String, name: json[1] as String);
  }

  Map<String, dynamic> toJson() {
    return {'code': code, 'name': name};
  }
}
