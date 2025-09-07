import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class CustomDateButton extends StatelessWidget {
  const CustomDateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: InnerShadowRRectPainter(
        blur: 7,
        borderRadius: 14,
        color: AppTheme.red.withAlpha(10),
      ),
      child: Container(
        width: 93.w,
        height: 32.h,
        decoration: BoxDecoration(
          color: AppTheme.red.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(14),
        ),
        alignment: Alignment.center,
        child: Text(
          "All dates",
          style: AppTextStyles.ts14_400.copyWith(color: AppTheme.red4),
        ),
      ),
    );
  }
}
