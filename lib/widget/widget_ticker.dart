import 'package:flutter/material.dart';
import 'package:ticker/model/ticker.dart';
import 'package:ticker/widget/unit_icon.dart';
import 'package:ticker/widget/widget_chart_candlestick.dart';
import 'package:ticker/widget/widget_chart_line.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class TickerWidget extends StatelessWidget {
  final Ticker ticker;

  const TickerWidget(this.ticker, {Key? key}) : super(key: key);

  final tickerTextName =
      const TextStyle(color: Color(0xFF93A9C9), fontSize: 10, fontWeight: FontWeight.bold);
  final tickerTextMarket =
      const TextStyle(color: Color(0xFF000000), fontSize: 12, fontWeight: FontWeight.normal);
  final tickerCaptionStatistic =
      const TextStyle(color: Color(0xFF93A9C9), fontSize: 8, fontWeight: FontWeight.bold);
  final tickerTextStatistic = const TextStyle(
      color: Color(0xFF000000),
      fontFamily: 'titillium',
      fontSize: 9,
      fontWeight: FontWeight.normal);
  final tickerTextPrice = const TextStyle(
      color: Color(0xFF000000), fontFamily: 'titillium', fontSize: 16, fontWeight: FontWeight.bold);
  final tickerTextPriceUsd = const TextStyle(
      color: Color(0xFF93A9C9),
      fontFamily: 'titillium',
      fontSize: 12,
      fontWeight: FontWeight.normal);

  final porcelain = const Color(0xFFF5F7F8);
  final colorPlus = const Color(0xFF4CAF50);
  final bgPlusDark = const Color(0x4DE0F2E9);
  final bgPlusLight = const Color(0x33E0F2E9);
  final colorMinus = const Color(0xFFFD2A47);
  final bgMinusDark = const Color(0x4DFFEBEE);
  final bgMinusLight = const Color(0x33FFEBEE);

  @override
  Widget build(BuildContext context) {
    // bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Card(
      //color: porcelain,
      margin: const EdgeInsets.all(2),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
            color: ticker.change24Percent < 0 ? bgMinusDark : bgPlusDark,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      UnitIcon(ticker.baseUnit, ticker.icon, 24),
                      const SizedBox(width: 8),
                      Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(ticker.name.toUpperCase(), style: tickerTextName),
                                const SizedBox(width: 4),
                                const Icon(Icons.star_border, size: 12, color: Color(0xFF93A9C9))
                              ],
                            ),
                            Text(
                              '${ticker.baseUnit.toUpperCase()}/${ticker.quoteUnit.toUpperCase()}',
                              style: tickerTextMarket,
                            )
                          ])
                    ],
                  )),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('change', style: tickerCaptionStatistic),
                          Text('${ticker.change24Percent}%', style: tickerTextStatistic)
                        ]),
                    const SizedBox(width: 8),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('min', style: tickerCaptionStatistic),
                          Text('${ticker.minPrice24}', style: tickerTextStatistic)
                        ]),
                    const SizedBox(width: 8),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('max', style: tickerCaptionStatistic),
                          Text('${ticker.maxPrice24}', style: tickerTextStatistic)
                        ]),
                    const SizedBox(width: 8),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('vol', style: tickerCaptionStatistic),
                          Text(ticker.volume24Formatted(), style: tickerTextStatistic)
                        ]),
                    const SizedBox(width: 8),
                    const Icon(Icons.notifications_outlined, color: Color(0xFF93A9C9)),
                  ]))
            ])),
        Container(
            color: ticker.change24Percent < 0 ? bgMinusLight : bgPlusLight,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Expanded(
                  flex: 40,
                  child:  LineChartWidget(
                  // child:  CandlestickChartWidget(
                    market: ticker.market,
                    colorLine: ticker.change24Percent < 0 ? colorMinus : colorPlus,
                  )),
              Expanded(
                  flex: 30,
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                        Text(ticker.bidPriceFormatted(), style: tickerTextPrice),
                        Text(ticker.bidPriceUsdFormatted(), style: tickerTextPriceUsd),
                      ]))),
              Expanded(
                  flex: 30,
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                        Text(ticker.askPriceFormatted(), style: tickerTextPrice),
                        Text(ticker.askPriceUsdFormatted(), style: tickerTextPriceUsd),
                      ]))),
            ])),
      ]),
    );
  }
}
