import 'package:http/http.dart' as http;
import 'package:ticker/kuna/model/history.dart';

import 'model/currency.dart';
import 'model/rate.dart';
import 'model/ticker.dart';
import 'model/market.dart';

class KunaProvider {
  static const uriGetCurrencies = 'https://api.kuna.io/v3/currencies';
  static const uriGetMarkets = 'https://api.kuna.io/v3/markets';
  static const uriGetTickers = 'https://api.kuna.io/v3/tickers?symbols=all';
  static const uriGetRates = 'https://api.kuna.io/v3/exchange-rates';
  static const uriGetHistory = 'https://api.kuna.io/v3/tv/history';

  Future<List<T>> _getList<T>(String stringUri, Function parse) async {
    final response = await http.get(Uri.parse(stringUri));
    return parse(response.body);
  }

  Future<List<Currency>> getCurrencies() => _getList(uriGetCurrencies, Currency.currenciesFromJson);

  Future<List<Market>> getMarkets() => _getList(uriGetMarkets, Market.marketsFromJson);

  Future<List> getTickers() => _getList(uriGetTickers, TickerKuna.tickersFromJson);

  Future<List> getRates() => _getList(uriGetTickers, Rate.ratesFromJson);

  Future<History> getHistory(String symbol, String resolution, int from, int to) async {
    var stringQuery = 'symbol=$symbol&resolution=$resolution&from=$from&to=$to';
    final response = await http.get(Uri.parse(uriGetHistory).replace(query: stringQuery));
    return History.historyFromJson(response.body);
  }

  Future<List> getRawData() async {
    List rawData = [];

    final responseTickers = http.get(Uri.parse(uriGetTickers));
    final responseMarkets = http.get(Uri.parse(uriGetMarkets));
    final responseCurrencies = http.get(Uri.parse(uriGetCurrencies));
    final responseRates = http.get(Uri.parse(uriGetRates));

    final responses = await Future.wait([
      responseTickers,
      responseMarkets,
      responseCurrencies,
      responseRates,
    ]);

    rawData.add(TickerKuna.tickersFromJson(responses[0].body));
    rawData.add(Market.marketsFromJson(responses[1].body));
    rawData.add(Currency.currenciesFromJson(responses[2].body));
    rawData.add(Rate.ratesFromJson(responses[3].body));

    return rawData;
  }
}
