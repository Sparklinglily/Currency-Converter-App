class ExchangeRate {
  final String baseCode;
  final String targetCode;
  final double rate;
  final DateTime lastUpdate;

  const ExchangeRate({
    required this.baseCode,
    required this.targetCode,
    required this.rate,
    required this.lastUpdate,
  });

  double convert(double amount) => amount * rate;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExchangeRate &&
        other.baseCode == baseCode &&
        other.targetCode == targetCode &&
        other.rate == rate;
  }

  @override
  int get hashCode => baseCode.hashCode ^ targetCode.hashCode ^ rate.hashCode;
}
