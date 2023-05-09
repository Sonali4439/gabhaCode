import 'package:flutter/material.dart';

class WatermarkPaint extends CustomPainter {
  final String price;
  final String watermark;

  WatermarkPaint(this.price, this.watermark);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 10.8, Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(WatermarkPaint oldDelegate) {
    return oldDelegate != this;
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is WatermarkPaint && runtimeType == other.runtimeType && price == other.price && watermark == other.watermark;

  @override
  int get hashCode => price.hashCode ^ watermark.hashCode;
}