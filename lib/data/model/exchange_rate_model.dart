import 'package:currency_converter/domain/entities/exchange.dart';

class ExchangeRateModel extends ExchangeRate {
  const ExchangeRateModel({
    required super.baseCode,
    required super.targetCode,
    required super.rate,
    required super.lastUpdate,
  });

  factory ExchangeRateModel.fromJson(Map<String, dynamic> json) {
    return ExchangeRateModel(
      baseCode: json['base_code'] as String,
      targetCode: json['target_code'] as String,
      rate: (json['conversion_rate'] as num).toDouble(),
      lastUpdate: DateTime.fromMillisecondsSinceEpoch(
        (json['time_last_update_unix'] as int) * 1000,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'base_code': baseCode,
      'target_code': targetCode,
      'conversion_rate': rate,
      'time_last_update_unix': lastUpdate.millisecondsSinceEpoch ~/ 1000,
    };
  }
}
