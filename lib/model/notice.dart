import 'dart:convert';

class Notice {
  int timestamp;
  String title;
  String message;

  Notice({required this.timestamp, required this.title, required this.message});

  factory Notice.fromJson(Map<String, dynamic> mapJson) => Notice(
        timestamp: mapJson['timestamp'] as int,
        title: mapJson['title'] as String,
        message: mapJson['message'] as String,
      );

  Map<String, dynamic> toJson() => {
        'timestamp': timestamp,
        'title': title,
        'message': message,
      };

  static List<Notice> notificationsFromJson(String stringJson) =>
      //List<Notification>.from(jsonDecode(jsonString).map((m) => Notification.fromJson(m)));
      jsonDecode(stringJson).map<Notice>((m) => Notice.fromJson(m)).toList();
}
