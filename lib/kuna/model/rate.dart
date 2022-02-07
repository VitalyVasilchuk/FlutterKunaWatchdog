import 'dart:convert';

class Rate {
  static List<Rate> ratesFromJson(String str) =>
      List<Rate>.from(jsonDecode(str).map((x) => Rate.fromJson(x)));

  static String rateToJson(List<Rate> data) => jsonEncode(List<dynamic>.from(data.map((x) => x.toJson())));

  String currency;
  double usd;
  double uah;
  double btc;
  double eur;
  double rub;

  Rate({
    required this.currency,
    required this.usd,
    required this.uah,
    required this.btc,
    required this.eur,
    required this.rub,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        currency: json["currency"],
        usd: json["usd"].toDouble(),
        uah: json["uah"].toDouble(),
        btc: json["btc"].toDouble(),
        eur: json["eur"].toDouble(),
        rub: json["rub"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "usd": usd,
        "uah": uah,
        "btc": btc,
        "eur": eur,
        "rub": rub,
      };
}
