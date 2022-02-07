import 'package:intl/intl.dart';

class Utils {
  static String getFormattedDecimal(num value) {
    int precision = getDecimalDigits(value);

    if (value >= 1000) {
      var nf = NumberFormat("#,##0", 'ru_RU');
      return nf.format(value);
    } else {
      return value.toStringAsFixed(precision);
    }
  }

  static int getDecimalDigits(num value) {
    double dValue = value.toDouble();
    if (dValue >= 1000) return 0;
    if (dValue >= 100) return 1;
    if (dValue >= 10) return 2;
    if (dValue >= 1) return 3;
    if (dValue >= 0.1) return 4;
    if (dValue >= 0.01) return 5;
    if (dValue >= 0.001) return 6;
    if (dValue >= 0.0001) return 7;
    if (dValue >= 0.00001) return 8;
    if (dValue >= 0.000001) return 9;
    return 10;
  }

  static String getLetterValue(num value) {
    String suffix = "";

    if (value >= 1000000000000) {
      value = value / 1000000000000;
      suffix = "T";
    } else if (value >= 1000000000) {
      value = value / 1000000000;
      suffix = "B";
    } else if (value >= 1000000) {
      value = value / 1000000;
      suffix = "M";
    } else if (value >= 1000) {
      value = value / 1000;
      suffix = "K";
    }
    return value.toStringAsFixed(2) + suffix;
  }

  static String getDateTimeString(int timestampMs) {
    return DateFormat('dd.MM.yyyy HH:mm').format(DateTime.fromMillisecondsSinceEpoch(timestampMs));
  }
}
