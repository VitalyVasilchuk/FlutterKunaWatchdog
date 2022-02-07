import 'dart:convert';

class Market {
  static List<Market> marketsFromJson(String stringJson) =>
      jsonDecode(stringJson).map<Market>((m) => Market.fromJson(m)).toList();

  static String marketsToJson(List<Market> markets) =>
      jsonEncode(markets.map((e) => e.toJson()).toList());

  Market({
    required this.id,
    required this.baseUnit,
    required this.quoteUnit,
    required this.basePrecision,
    required this.quotePrecision,
    required this.displayPrecision,
    required this.priceChange,
  });

  String id;
  String baseUnit;
  String quoteUnit;
  int basePrecision;
  int quotePrecision;
  int displayPrecision;
  double priceChange;

  factory Market.fromJson(Map<String, dynamic> json) => Market(
        id: json["id"],
        baseUnit: json["base_unit"],
        quoteUnit: json["quote_unit"],
        basePrecision: json["base_precision"],
        quotePrecision: json["quote_precision"],
        displayPrecision: json["display_precision"],
        priceChange: json["price_change"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "base_unit": baseUnit,
        "quote_unit": quoteUnit,
        "base_precision": basePrecision,
        "quote_precision": quotePrecision,
        "display_precision": displayPrecision,
        "price_change": priceChange,
      };
}
