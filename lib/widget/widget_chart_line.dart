import 'package:flutter/material.dart';
import 'package:ticker/kuna/model/history.dart';
import 'package:ticker/repository.dart';

import 'chart_line.dart';

class LineChartWidget extends StatelessWidget {
  final String market;
  final Color colorLine;

  const LineChartWidget({required this.market, this.colorLine = Colors.black45, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Repository.getHistoryMarket(market),
      //future: Repository.getHistoryFromJson(),
      builder: builder,
    );
  }

  Widget builder(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError) return Center(child: Text(snapshot.error.toString()));
    if (snapshot.hasData) return ChartWidget(snapshot.data!, colorLine);
    return const Center(
        child: LinearProgressIndicator(
      minHeight: 2,
    ));
  }
}

class ChartWidget extends StatelessWidget {
  final History history;
  final Color colorLine;

  const ChartWidget(this.history, this.colorLine, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _minYValue = history.h.reduce((curr, next) => curr < next ? curr : next);
    for (var i = 0; i < history.h.length; i++) {
      history.h[i]-=_minYValue;
    }

    return Container(
        height: 48,
        color: Colors.transparent,
        padding: const EdgeInsets.all(8),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            CustomPaint(
              size: Size.infinite,
              painter: LineChart(
                points: history.h,
                colorLine: colorLine,
              ),
            ),
            Container(
              color: const Color(0xFFF5F7F8),
              padding: const EdgeInsets.all(1),
              child: const Text(
                'H1',
                style: TextStyle(fontSize: 8),
              ),
            )
          ],
        ));
  }
}
