import 'dart:convert';

class Candlestick {
  static Candlestick candlestickFromJson(String str) => Candlestick.fromJson(jsonDecode(str));

  static String candlestickToJson(Candlestick data) => jsonEncode(data.toJson());

  List<String> label;
  List<double> high;
  List<double> low;
  List<double> open;
  List<double> close;

  Candlestick({
    required this.label,
    required this.high,
    required this.low,
    required this.open,
    required this.close,
  });

  factory Candlestick.fromJson(Map<String, dynamic> json) => Candlestick(
        label: List<String>.from(json["label"].map((x) => x)),
        high: List<double>.from(json["high"].map((x) => x.toDouble())),
        low: List<double>.from(json["low"].map((x) => x.toDouble())),
        open: List<double>.from(json["open"].map((x) => x.toDouble())),
        close: List<double>.from(json["close"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "label": List<dynamic>.from(label.map((x) => x)),
        "high": List<dynamic>.from(high.map((x) => x)),
        "low": List<dynamic>.from(low.map((x) => x)),
        "open": List<dynamic>.from(open.map((x) => x)),
        "close": List<dynamic>.from(close.map((x) => x)),
      };
}
