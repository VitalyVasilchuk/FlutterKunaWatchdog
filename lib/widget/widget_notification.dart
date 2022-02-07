import 'package:flutter/material.dart';
import 'package:ticker/model/notice.dart';
import 'package:ticker/utils.dart';

class NotificationWidget extends StatelessWidget {
  final Notice notification;

  const NotificationWidget(this.notification, {Key? key}) : super(key: key);

  final colorNotice = const Color(0xFF676793);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: CircleAvatar(
            radius: 20,
            child: Icon(Icons.notifications),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: colorNotice,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        Utils.getDateTimeString(notification.timestamp),
                        style: TextStyle(
                          fontSize: 10,
                          color: colorNotice,
                        ),
                      )
                    ]),
                Text(
                  notification.message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: colorNotice,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
