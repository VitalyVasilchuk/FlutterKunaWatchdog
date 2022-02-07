import 'dart:convert';

import 'package:ticker/utils.dart';

class Alert {
  String market;
  int created;
  int updated;
  bool active;
  double low;
  double high;

  Alert({
    required this.market,
    required this.created,
    required this.updated,
    required this.active,
    required this.low,
    required this.high,
  });

  factory Alert.fromJson(Map<String, dynamic> jsonMap) => Alert(
        market: jsonMap['market'],
        created: jsonMap['created'].toInt(),
        updated: jsonMap['updated'].toInt(),
        active: jsonMap['active'],
        low: jsonMap['low'].toDouble(),
        high: jsonMap['high'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'market': market,
        'created': created,
        'updated': updated,
        'active': active,
        'low': low,
        'high': high,
      };

  static List<Alert> alertsFromJson(String stringJson) =>
      jsonDecode(stringJson).map<Alert>((m) => Alert.fromJson(m)).toList();

  String lowFormatted() => Utils.getFormattedDecimal(low);

  String highFormatted() => Utils.getFormattedDecimal(high);

  String updatedFormatted() => Utils.getDateTimeString(updated);
}
