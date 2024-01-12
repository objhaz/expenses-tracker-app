// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

import '../common/color_extension.dart';

class ArcModel {
  final Color color;
  final double value;

  ArcModel({required this.color, required this.value});
}

class CustomArc180 extends CustomPainter {
  final double start;
  final double end;
  final double width;
  final double blurwidth;
  final double bgwidth;
  final List<ArcModel> drawArc;
  final double space;

  CustomArc180({
    this.start = 0,
    this.end = 180,
    this.width = 15,
    this.blurwidth = 6,
    this.bgwidth = 10,
    this.space = 6,
    required this.drawArc,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height), radius: size.width / 2);

    Paint backgroundPaint = Paint();
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = bgwidth;
    backgroundPaint.strokeCap = StrokeCap.round;
    backgroundPaint.color = TColor.gray60.withOpacity(0.5);

    var startVal = 180.0 + start;
    var drawStart = startVal;
    canvas.drawArc(
        rect, radians(startVal), radians(180), false, backgroundPaint);

    for (var arcbj in drawArc) {
      ;
      Paint activePaint = Paint();
      activePaint.color = arcbj.color;
      activePaint.style = PaintingStyle.stroke;
      activePaint.strokeWidth = 15;
      activePaint.strokeCap = StrokeCap.round;

      Paint shadowPaint = Paint()
        ..color = arcbj.color.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = width + blurwidth
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

      // draw shaddow arc
      Path path = Path();
      path.addArc(rect, radians(drawStart), radians(arcbj.value - space));
      canvas.drawPath(path, shadowPaint);

      canvas.drawArc(rect, radians(drawStart), radians(arcbj.value - space),
          false, activePaint);

      drawStart = drawStart + arcbj.value + space;
    }
  }

  @override
  bool shouldRepaint(CustomArc180 oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomArc180 oldDelegate) => false;
}
