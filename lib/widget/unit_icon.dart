import 'package:flutter/material.dart';

class UnitIcon extends StatelessWidget {
  final String unitCode;
  final String urlIcon;
  final double size;
  final double radius;
  final double textSize;

  const UnitIcon(this.unitCode, this.urlIcon, this.size, {Key? key})
      : radius = size / 2,
        textSize = size / 3,
        super(key: key);

  @override
  Widget build(BuildContext context) => Image.asset(
        'assets/units/$unitCode.png'.toLowerCase(),
        width: size,
        height: size,
        errorBuilder: (context, object, stack) {
          return Image.network(
            urlIcon,
            width: size,
            height: size,
            errorBuilder: (context, object, stack) => CircleAvatar(
              maxRadius: 12,
              child: Text(
                unitCode.toUpperCase(),
                maxLines: 1,
                style: const TextStyle(fontSize: 8),
              ),
            ),
          );
        },
      );
}
