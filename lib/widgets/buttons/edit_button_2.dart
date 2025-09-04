import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class EditButton2 extends StatelessWidget {
  const EditButton2({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: InnerShadowRRectPainter(
          borderRadius: 14,
          blur: 8,
          color: AppTheme.red.withValues(alpha: 0.1),
        ),
        child: Container(
          width: 118.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: AppTheme.red.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(14),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/png/pen.png',
                width: 16.r,
                height: 16.r,
                fit: BoxFit.fill,
              ),
              Text(
                "Edit Skills",
                style: AppTextStyles.ts14_400.copyWith(color: AppTheme.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
