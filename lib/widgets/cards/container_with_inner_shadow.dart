import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class ContainerWithInnerShadow extends StatelessWidget {
  const ContainerWithInnerShadow({
    super.key,
    this.padding,
    required this.child,
  });

  final EdgeInsets? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: InnerShadowRRectPainter(
        blur: 40,
        offset: Offset.zero,
        color: Colors.white.withAlpha(4),
      ),
      child: Container(
        width: 135.w,
        height: 160.h,
        decoration: BoxDecoration(
          gradient: AppTheme.blackGradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 20,
              color: Colors.black.withValues(alpha: 0.5),
            ),
          ],
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}
