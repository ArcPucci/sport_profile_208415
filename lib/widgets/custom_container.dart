import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

import '../utils/utils.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    required this.child,
    this.borderRadius,
    this.bgColor,
  });

  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final double? borderRadius;
  final Color? bgColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: InnerShadowRRectPainter(
        blur: 40,
        borderRadius: borderRadius ?? 20,
        color: Colors.white.withAlpha(4),
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: AppTheme.blackGradient,
          borderRadius: BorderRadius.circular(borderRadius ?? 14),
          border: Border.all(
            width: 1.sp,
            color: Colors.white.withValues(alpha: 0.01),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 20,
              color: Colors.black.withValues(alpha: 0.5),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        padding: padding,
        child: Container(color: bgColor, child: child),
      ),
    );
  }
}
