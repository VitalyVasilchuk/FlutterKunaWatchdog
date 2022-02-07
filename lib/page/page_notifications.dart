import 'package:flutter/material.dart';
import 'package:ticker/model/notice.dart';
import 'package:ticker/repository.dart';
import 'package:ticker/widget/widget_notification.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Repository.getNotificationsFromJson(),
      builder: builder,
    );
  }

  Widget builder(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError) return Center(child: Text(snapshot.error.toString()));
    if (snapshot.hasData) return NotificationList(snapshot.data!);
    return const Center(child: CircularProgressIndicator());
  }
}

class NotificationList extends StatelessWidget {
  final List<Notice> notifications;

  const NotificationList(this.notifications, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: notifications.length,
      itemBuilder: (context, index) => NotificationWidget(notifications[index]),
      separatorBuilder: (context, index) => const Divider(height: 0, indent: 72,),
    );
  }
}
