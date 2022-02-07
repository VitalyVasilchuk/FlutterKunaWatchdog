import 'dart:convert';

class Currency {
  static List<Currency> currenciesFromJson(String stringJson) =>
      jsonDecode(stringJson).map<Currency>((m) => Currency.fromJson(m)).toList();

  static String currenciesToJson(List<Currency> currencies) =>
      jsonEncode(currencies.map((e) => e.toJson()).toList());

  Currency({
    required this.id,
    required this.code,
    required this.name,
    required this.hasMemo,
    required this.icons,
    required this.coin,
    required this.explorerLink,
    required this.sortOrder,
    required this.precision,
    required this.privileged,
    required this.fuel,
  });

  int id;
  String code;
  String name;
  bool hasMemo;
  Icons icons;
  bool coin;
  String explorerLink;
  int sortOrder;
  Precision precision;
  bool privileged;
  bool fuel;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        hasMemo: json["has_memo"]?? false,
        icons: Icons.fromJson(json["icons"]),
        coin: json["coin"]?? false,
        explorerLink: json["explorer_link"] ?? '',
        sortOrder: json["sort_order"],
        precision: Precision.fromJson(json["precision"]),
        privileged: json["privileged"]?? false,
        fuel: json["fuel"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "has_memo": hasMemo,
        "icons": icons.toJson(),
        "coin": coin,
        "explorer_link": explorerLink,
        "sort_order": sortOrder,
        "precision": precision.toJson(),
        "privileged": privileged,
        "fuel": fuel,
      };
}

class Icons {
  Icons({
    required this.std,
    required this.xl,
    required this.png2X,
    required this.png3X,
  });

  String std;
  String xl;
  String png2X;
  String png3X;

  factory Icons.fromJson(Map<String, dynamic> json) => Icons(
        std: json["std"],
        xl: json["xl"],
        png2X: json["png_2x"],
        png3X: json["png_3x"],
      );

  Map<String, dynamic> toJson() => {
        "std": std,
        "xl": xl,
        "png_2x": png2X,
        "png_3x": png3X,
      };
}

class Precision {
  Precision({
    required this.real,
    required this.trade,
  });

  int real;
  int trade;

  factory Precision.fromJson(Map<String, dynamic> json) => Precision(
        real: json["real"],
        trade: json["trade"],
      );

  Map<String, dynamic> toJson() => {
        "real": real,
        "trade": trade,
      };
}
