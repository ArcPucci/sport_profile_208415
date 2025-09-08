import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

import '../utils/utils.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
    required this.percent,
    this.width,
    this.height,
    this.borderRadius,
    this.color,
  });

  final Color? color;
  final double percent;
  final double? width;
  final double? height;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 200.w,
      height: height ?? 16.h,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(borderRadius ?? 40),
      ),
      alignment: Alignment.centerLeft,
      child: CustomPaint(
        painter: InnerShadowRRectPainter(
          offset: Offset(0, 8),
          blur: 8,
          color: Colors.white.withValues(alpha: 0.25),
        ),
        child: CustomPaint(
          painter: InnerShadowRRectPainter(
            offset: Offset(0, -8),
            blur: 24,
            color: Colors.black.withValues(alpha: 0.15),
          ),
          child: Container(
            width: (width ?? 200.w) * percent,
            height: height ?? 16.h,
            decoration: BoxDecoration(
              color: color ?? AppTheme.green2,
              borderRadius: BorderRadius.circular(borderRadius ?? 40),
            ),
          ),
        ),
      ),
    );
  }
}
