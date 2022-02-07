import 'package:flutter/material.dart';
import 'package:ticker/model/candlestick.dart';

class CandlestickChart extends CustomPainter {
  static double spacePercent = 0.15;

  Candlestick data;
  final Color colorLine;

  double _width = 0;
  double _height = 0;
  double _scale = 0;

  int _candleCount = 0;
  double _minValue = 0;
  double _maxValue = 0;

  final colorNeutral = Colors.blue;
  final colorHigh = Colors.green;
  final colorLow = Colors.red;

  CandlestickChart({required this.data, this.colorLine = Colors.black45}) {
    _candleCount = data.label.length;
    _minValue = data.low.reduce((curr, next) => curr > next ? curr : next);
    _maxValue = data.low.reduce((curr, next) => curr < next ? curr : next);
  }

  @override
  void paint(Canvas canvas, Size size) {
    _width = size.width;
    _height = size.height;
    _scale = _height / _maxValue;

    double placeWidth = _width / _candleCount;
    double spaceWidth = placeWidth * spacePercent;
    double x1, x2, centerX, y1, y2, centerY = 0;

    var paint = Paint();

    paint.color = Colors.black87;
    paint.strokeWidth=0.5;
    canvas.drawLine(Offset(0, _height * 0.25), Offset(_width, _height * 0.25), paint);
    canvas.drawLine(Offset(0, _height * 0.5 ), Offset(_width, _height * 0.5 ), paint);
    canvas.drawLine(Offset(0, _height * 0.75), Offset(_width, _height * 0.75), paint);

    for (int i = 0; i < _candleCount; i++) {
      x1 = i * placeWidth + spaceWidth;
      x2 = (i + 1) * placeWidth - spaceWidth;
      centerX = (x1 + x2) / 2;

      y1 = _getYPos(data.close[i]);
      y2 = _getYPos(data.open[i]);

      if (i % 3 == 0) {
        paint.color = Colors.black87;
        paint.strokeWidth = 0.5;
        canvas.drawLine(Offset(centerX, 0), Offset(centerX, _height), paint);
      }

      paint.strokeWidth = 1;
      paint.style = PaintingStyle.fill;
      paint.color = (data.open[i] == (data.close[i])
          ? colorNeutral
          : data.open[i] < data.close[i]
              ? colorHigh
              : colorLow);

      canvas.drawRect(Rect.fromLTRB(x1, y1, x2, y2), paint);
      canvas.drawLine(
          Offset(centerX, _getYPos(data.high[i])), Offset(centerX, _getYPos(data.low[i])), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  double _getYPos(num value) {
    return _height - ((value - _minValue) * _height / (_maxValue - _minValue));
  }
}
