import 'package:flutter/material.dart';
import 'package:ticker/model/alert.dart';
import 'package:ticker/repository.dart';
import 'package:ticker/widget/widget_alert.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Repository.getAlertsFromJson(),
      builder: builder,
    );
  }

  Widget builder(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError) return Center(child: Text(snapshot.error.toString()));
    if (snapshot.hasData) return AlertList(snapshot.data!);
    return const Center(child: CircularProgressIndicator());
  }
}

class AlertList extends StatelessWidget {
  final List<Alert> alerts;

  const AlertList(this.alerts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: alerts.length,
      itemBuilder: (context, index) => AlertWidget(alerts[index]),
      //separatorBuilder: (BuildContext context, int index) => Divider(height: 0,),
    );
  }
}
