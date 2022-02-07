import 'package:flutter/material.dart';

class LineChart extends CustomPainter {
  static const double graphSmoothness = 0.1;

  List<double> points;
  final Color colorLine;

  double _stepX = 0;
  double _maxYValue = 0;
  double _scale = 0;
  double _width = 0;
  double _height = 0;

  LineChart({required this.points, this.colorLine = Colors.black45});

  @override
  void paint(Canvas canvas, Size size) {
    _width = size.width;
    _height = size.height;
    _stepX = _width / (points.length - 1);
    _maxYValue = points.reduce((curr, next) => curr > next ? curr : next);
    _scale = _height / _maxYValue;

    var paint = Paint()
      ..color = colorLine
      ..strokeWidth = 2
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var path = Path();
    path.moveTo(0, size.height - points[0] * _scale);

    for (int i = 0; i < points.length - 1; i++) {
      double thisPointX = _getXPos(i);
      double thisPointY = _getYPos(points[i]);
      double nextPointX = _getXPos(i + 1);
      double nextPointY = _getYPos(points[_si(i + 1)]);

      double startDiffX = (nextPointX - _getXPos(_si(i - 1)));
      double startDiffY = (nextPointY - _getYPos(points[_si(i - 1)]));
      double endDiffX = (_getXPos(_si(i + 2)) - thisPointX);
      double endDiffY = (_getYPos(points[_si(i + 2)]) - thisPointY);

      double firstControlX = thisPointX + (graphSmoothness * startDiffX);
      double firstControlY = thisPointY + (graphSmoothness * startDiffY);
      double secondControlX = nextPointX - (graphSmoothness * endDiffX);
      double secondControlY = nextPointY - (graphSmoothness * endDiffY);

      path.cubicTo(
          firstControlX, firstControlY, secondControlX, secondControlY, nextPointX, nextPointY);
    }

    // canvas.drawShadow(path, Color(0xff808080), 8, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  double _getXPos(num value) {
    return value * _stepX;
  }

  double _getYPos(num value) {
    return _height - value * _scale;
  }

  int _si(num i) {
    if (i > points.length - 1) {
      return points.length - 1;
    } else if (i < 0) {
      return 0;
    }
    return i.toInt();
  }
}
