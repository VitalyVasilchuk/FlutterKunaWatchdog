import 'dart:convert';
import 'package:ticker/utils.dart';

class Ticker {
  Ticker({
    required this.askPrice,
    required this.askPriceUsd,
    required this.askVolume,
    required this.baseUnit,
    required this.bidPrice,
    required this.bidPriceUsd,
    required this.bidVolume,
    required this.change24,
    required this.change24Percent,
    required this.chartFrame,
    required this.checked,
    required this.icon,
    required this.lastPrice,
    required this.market,
    required this.maxPrice24,
    required this.minPrice24,
    required this.name,
    required this.observed,
    required this.points,
    required this.precision,
    required this.quoteUnit,
    required this.timestamp,
    required this.volume24,
  });

  double askPrice;
  double askPriceUsd;
  double askVolume;
  String baseUnit;
  double bidPrice;
  double bidPriceUsd;
  double bidVolume;
  double change24;
  double change24Percent;
  String chartFrame;
  bool checked;
  String icon;
  double lastPrice;
  String market;
  double maxPrice24;
  double minPrice24;
  String name;
  bool observed;
  List<double> points;
  int precision;
  String quoteUnit;
  int timestamp;
  double volume24;

  factory Ticker.fromJson(Map<String, dynamic> mapJson) => Ticker(
        askPrice: mapJson['askPrice'].toDouble(),
        askPriceUsd: mapJson['askPriceUsd'].toDouble(),
        askVolume: mapJson['askVolume'].toDouble(),
        baseUnit: mapJson['baseUnit'],
        bidPrice: mapJson['bidPrice'].toDouble(),
        bidPriceUsd: mapJson['bidPriceUsd'].toDouble(),
        bidVolume: mapJson['bidVolume'].toDouble(),
        change24: mapJson['change24'].toDouble(),
        change24Percent: mapJson['change24Percent'].toDouble(),
        chartFrame: mapJson['chartFrame'],
        checked: mapJson['checked'],
        icon: mapJson['icon'],
        lastPrice: mapJson['lastPrice'].toDouble(),
        market: mapJson['market'],
        maxPrice24: mapJson['maxPrice24'].toDouble(),
        minPrice24: mapJson['minPrice24'].toDouble(),
        name: mapJson['name'],
        observed: mapJson['observed'],
        points: List<double>.from(mapJson['points'].map((x) => x.toDouble())),
        precision: mapJson['precision'],
        quoteUnit: mapJson['quoteUnit'],
        timestamp: mapJson['timestamp'],
        volume24: mapJson['volume24'].toDouble(),
      );

  static List<Ticker> tickersFromJson(String stringJson) {
    return List<Ticker>.from(jsonDecode(stringJson).map((m) => Ticker.fromJson(m)));
  }

  String volume24Formatted() => Utils.getLetterValue(volume24);

  String askPriceFormatted() => Utils.getFormattedDecimal(askPrice);

  String askPriceUsdFormatted() => '\$${Utils.getFormattedDecimal(askPriceUsd)}';

  String bidPriceFormatted() => Utils.getFormattedDecimal(bidPrice);

  String bidPriceUsdFormatted() => '\$${Utils.getFormattedDecimal(bidPriceUsd)}';

  String marketFormatted()=>'$baseUnit/$quoteUnit'.toUpperCase();
}
