import 'package:flutter/material.dart';
import 'package:ticker/repository.dart';
import 'package:ticker/widget/widget_ticker.dart';

import '../model/ticker.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: Repository.getTickersFromJson(),
      future: Repository.getTickersFromKuna(),
      builder: futureBuilder,
    );
  }

  Widget futureBuilder(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    if (snapshot.hasError) {
      return Center(
        child: Text(
            'an error occurred when requesting a list of tickers\n' + snapshot.error.toString()),
      );
    } else if (snapshot.hasData) {
      return TickerList(tickers: snapshot.data!);
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

class TickerList extends StatelessWidget {
  final List<Ticker> tickers;

  const TickerList({Key? key, required this.tickers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tickers.length,
      itemBuilder: (context, index) => TickerWidget(tickers[index]),
    );
  }
}
