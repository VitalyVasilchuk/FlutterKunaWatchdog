import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:ticker/kuna/model/currency.dart';
import 'package:ticker/kuna/model/market.dart';
import 'package:ticker/kuna/model/rate.dart';
import 'package:ticker/kuna/model/ticker.dart';
import 'package:ticker/kuna/provider.dart';
import 'package:ticker/model/candlestick.dart';
import 'package:ticker/utils.dart';
import 'kuna/model/history.dart';
import 'model/alert.dart';
import 'model/notice.dart';
import 'model/subscription.dart';
import 'model/ticker.dart';

class Repository {
  static Future getTickersFromJson() async {
    String stringJson = await rootBundle.loadString('assets/data/tickers.json');
    List<Ticker> tickers = Ticker.tickersFromJson(stringJson);

    tickers.sort(_sortTickers);

    return tickers;
  }

  static Future getTickersFromKuna() async {
    List<Ticker> tickers = [];

    await KunaProvider().getRawData().then((rawData) {
      final List<TickerKuna> prices = rawData[0];
      final List<Market> markets = rawData[1];
      final List<Currency> currencies = rawData[2];
      final List<Rate> rates = rawData[3];

      for (var t in prices) {
        Market market = markets.firstWhere((element) => element.id == t.market);
        Currency currency = currencies.firstWhere((element) => element.code == market.baseUnit);
        Rate rate = rates.firstWhere((element) => element.currency == market.quoteUnit);

        tickers.add(
          Ticker(
            askPrice: t.askPrice,
            askPriceUsd: t.askPrice * rate.usd,
            askVolume: t.askVolume,
            baseUnit: market.baseUnit,
            bidPrice: t.bidPrice,
            bidPriceUsd: t.bidPrice * rate.usd,
            bidVolume: t.bidVolume,
            change24: t.change24,
            change24Percent: t.change24Percent,
            chartFrame: 'H1',
            checked: false,
            icon: currency.icons.png3X,
            lastPrice: t.lastPrice,
            market: market.id,
            maxPrice24: t.maxPrice24,
            minPrice24: t.minPrice24,
            name: currency.name,
            observed: false,
            points: [5, 0, 1, 3, 2, 3, 1, 0],
            precision: market.basePrecision,
            quoteUnit: market.quoteUnit,
            timestamp: DateTime.now().millisecondsSinceEpoch,
            volume24: t.volume24,
          ),
        );
      }
    });

    tickers.sort(_sortTickers);

    return tickers;
  }

  static Future getHistoryMarket(String symbol) async {
    final int to = (DateTime.now().millisecondsSinceEpoch/1000).ceil();
    final int from = to - 24 * 60 * 60;
    return KunaProvider().getHistory(symbol, '60', from, to);
  }

  static Future getAlertsFromJson() async {
    String stringJson = await rootBundle.loadString('assets/data/alerts.json');
    return Alert.alertsFromJson(stringJson);
  }

  static Future getNotificationsFromJson() async {
    String stringJson = await rootBundle.loadString('assets/data/notifications.json');
    return Notice.notificationsFromJson(stringJson);
  }

  static Future getSubscriptionsFromJson() async {
    String stringJson = await rootBundle.loadString('assets/data/subscriptions.json');
    return Subscription.subscriptionsFromJson(stringJson);
  }

  static Future getHistoryFromJson() async {
    String stringJson = await rootBundle.loadString('assets/data/history.json');
    return Candlestick.candlestickFromJson(stringJson);
  }

  static int _sortTickers(Ticker t1, Ticker t2) {
    int result = 0;

    String u1 = t1.quoteUnit.toUpperCase().compareTo('UAH') == 0 ? '1' : '2';
    String u2 = t2.quoteUnit.toUpperCase().compareTo('UAH') == 0 ? '1' : '2';

    result = u1.compareTo(u2);
    if (result != 0) return result;

    result = t1.quoteUnit.compareTo(t2.quoteUnit);
    if (result != 0) return result;

    result = t1.baseUnit.compareTo(t2.baseUnit);
    if (result != 0) return result;

    return result;
  }

  void _printNotes(List<Ticker> tickers) {
    print(jsonEncode(tickers
        .map((t) => Notice(
            timestamp: DateTime.now().millisecondsSinceEpoch,
            title: '${t.marketFormatted()}: ${Utils.getFormattedDecimal(t.bidPrice)}',
            message: 'the higher price limit has been reached'))
        .toList()));
  }

  void _printAlerts(List<Ticker> tickers) {
    print(jsonEncode(tickers
        .map((t) => Alert(
            market: t.marketFormatted(),
            created: DateTime.now().millisecondsSinceEpoch,
            updated: DateTime.now().millisecondsSinceEpoch,
            active: true,
            low: t.bidPrice,
            high: t.askPrice))
        .toList()));
  }
}
