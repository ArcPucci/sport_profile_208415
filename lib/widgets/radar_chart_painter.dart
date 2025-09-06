import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sport_profile_208415/utils/utils.dart';

class RadarChartPainter extends CustomPainter {
  final List<String> features;
  final List<int> values;
  final int ticks;
  final double maxValue;

  RadarChartPainter({
    required this.features,
    required this.values,
    this.ticks = 5,
    this.maxValue = 50,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint gridPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.2)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final Paint dataPaint = Paint()
      ..color = AppTheme.green.withValues(alpha: 0.15)
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = AppTheme.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 * 0.8;
    final angleStep = 2 * pi / features.length;

    for (int t = 1; t <= ticks; t++) {
      final r = radius * (t / ticks);
      final path = Path();
      for (int i = 0; i < features.length; i++) {
        final angle = -pi / 2 + i * angleStep;
        final x = center.dx + r * cos(angle);
        final y = center.dy + r * sin(angle);
        if (i == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path.close();
      canvas.drawPath(path, gridPaint);
    }

    for (int i = 0; i < features.length; i++) {
      final angle = -pi / 2 + i * angleStep;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      canvas.drawLine(center, Offset(x, y), gridPaint);

      final textPainter = TextPainter(
        text: TextSpan(
          text: features[i],
          style: AppTextStyles.ts14_500.copyWith(
            color: Colors.white.withValues(alpha: 0.4),
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      const labelPadding = 20.0;
      final labelX = center.dx + (radius + labelPadding) * cos(angle);
      final labelY = center.dy + (radius + labelPadding) * sin(angle);

      final offset = Offset(
        labelX - textPainter.width / 2,
        labelY - textPainter.height / 2,
      );
      textPainter.paint(canvas, offset);
    }

    final dataPath = Path();
    for (int i = 0; i < features.length; i++) {
      final angle = -pi / 2 + i * angleStep;
      final valueRadius = radius * (values[i] / maxValue);
      final x = center.dx + valueRadius * cos(angle);
      final y = center.dy + valueRadius * sin(angle);
      if (i == 0) {
        dataPath.moveTo(x, y);
      } else {
        dataPath.lineTo(x, y);
      }
    }
    dataPath.close();

    canvas.drawPath(dataPath, dataPaint);

    final glowPaint = Paint()
      ..color = AppTheme.green.withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawPath(dataPath, glowPaint);

    canvas.drawPath(dataPath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
