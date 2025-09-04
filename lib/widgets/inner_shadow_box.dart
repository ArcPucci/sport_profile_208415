import 'package:flutter/material.dart';

class InnerShadowRRectPainter extends CustomPainter {
  final Color color;
  final double blur;
  final Offset offset;
  final double borderRadius;

  InnerShadowRRectPainter({
    this.color = Colors.black54,
    this.blur = 10,
    this.offset = Offset.zero,
    this.borderRadius = 20,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    final Paint shadowPaint = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blur);

    final Path outerPath = Path()..addRect(rect.inflate(20));
    final Path innerPath = Path()..addRRect(rrect);

    final Path shadowPath = Path.combine(
      PathOperation.difference,
      outerPath,
      innerPath,
    );

    canvas.save();
    canvas.clipRRect(rrect);

    canvas.saveLayer(rect, Paint());
    canvas.translate(-offset.dx, -offset.dy);
    canvas.drawPath(shadowPath, shadowPaint);
    canvas.restore();

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
