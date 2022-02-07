import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final blueZodiac = const Color(0xFF0D0D3F);
  final greyContext = const Color(0xFF93A9C9);
  final IconData icon;
  final String title;

  final Widget widget;

  const MenuItem(this.icon, this.title, this.widget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                icon,
                size: 24,
                color: greyContext,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 14,
                    color: blueZodiac,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.chevron_right,
                size: 24,
                color: blueZodiac,
              ),
            )
          ],
        ),
      );
}
