extension StringExtension on String {
  bool get isValidNumber {
    return double.tryParse(this) != null;
  }

  double get toDouble {
    return double.tryParse(this) ?? 0.0;
  }
}

extension DoubleExtension on double {
  String get formatted {
    if (this == 0) return '0.00';

    if (this < 0.01) {
      return toStringAsFixed(4);
    } else if (this < 0.1) {
      return toStringAsFixed(3);
    } else {
      return toStringAsFixed(2);
    }
  }

  String get exchangeRateFormatted {
    if (this == 0) return '0.00';

    if (this < 0.001) {
      return toStringAsFixed(6);
    } else if (this < 0.01) {
      return toStringAsFixed(4);
    } else if (this < 0.1) {
      return toStringAsFixed(3);
    } else {
      return toStringAsFixed(2);
    }
  }

  String get twoDecimals {
    return toStringAsFixed(2);
  }
}
