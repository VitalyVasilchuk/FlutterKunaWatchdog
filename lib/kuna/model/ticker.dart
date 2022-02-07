import 'dart:convert';

class TickerKuna {
  String market;
  double bidPrice;
  double bidVolume;
  double askPrice;
  double askVolume;
  double change24;
  double change24Percent;
  double lastPrice;
  double volume24;
  double maxPrice24;
  double minPrice24;

  TickerKuna({
    required this.market,
    required this.bidPrice,
    required this.bidVolume,
    required this.askPrice,
    required this.askVolume,
    required this.change24,
    required this.change24Percent,
    required this.lastPrice,
    required this.volume24,
    required this.maxPrice24,
    required this.minPrice24,
  });

  factory TickerKuna.fromList(List<dynamic> list) => TickerKuna(
        market: list[0],
        bidPrice: list[1],
        bidVolume: list[2],
        askPrice: list[3],
        askVolume: list[4],
        change24: list[5],
        change24Percent: list[6],
        lastPrice: list[7],
        volume24: list[8],
        maxPrice24: list[9],
        minPrice24: list[10],
      );

  static List<TickerKuna> tickersFromJson(String stringJson) =>
      jsonDecode(stringJson).map<TickerKuna>((e) => TickerKuna.fromList(e)).toList();
}
