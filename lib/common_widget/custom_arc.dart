// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

import '../common/color_extension.dart';

class CustomArcPainter extends CustomPainter {
  final double start;
  final double end;
  final double width;
  final double blurwidth;

  CustomArcPainter({
    this.start = 0,
    this.end = 270,
    this.width = 15,
    this.blurwidth = 6,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);

    var gradientColor = LinearGradient(
        colors: [TColor.secondary, TColor.secondary],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);

    Paint activePaint = Paint()..shader = gradientColor.createShader(rect);
    activePaint.style = PaintingStyle.stroke;
    activePaint.strokeWidth = 15;
    activePaint.strokeCap = StrokeCap.round;

    Paint backgroundPaint = Paint();
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = width;
    backgroundPaint.strokeCap = StrokeCap.round;
    backgroundPaint.color = TColor.gray60.withOpacity(0.5);

    Paint shadowPaint = Paint()
      ..color = TColor.secondary.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width + blurwidth
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    var startVal = 135.0 + start;

    canvas.drawArc(
        rect, radians(startVal), radians(270), false, backgroundPaint);
    // draw shaddow arc

    Path path = Path();
    path.addArc(rect, radians(startVal), radians(end));
    canvas.drawPath(path, shadowPaint);

    canvas.drawArc(rect, radians(startVal), radians(end), false, activePaint);
  }

  @override
  bool shouldRepaint(CustomArcPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomArcPainter oldDelegate) => false;
}
