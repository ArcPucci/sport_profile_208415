import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/utils/utils.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

class CustomSelector extends StatelessWidget {
  const CustomSelector({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    this.isOpen = false,
    this.onTap,
  });

  final String title;
  final String icon;
  final String value;
  final bool isOpen;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: InnerShadowRRectPainter(
          blur: 40,
          borderRadius: 20,
          color: Colors.white.withAlpha(4),
        ),
        child: Container(
          width: 358.w,
          height: 72.h,
          decoration: BoxDecoration(
            gradient: AppTheme.blackGradient,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1.sp, color: Colors.white.withAlpha(1)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 20,
                color: Colors.black.withAlpha(50),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Image.asset(
                icon,
                width: 20.r,
                height: 20.r,
                color: AppTheme.green,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.ts12_500.copyWith(
                        color: Colors.white.withValues(alpha: 0.4),
                      ),
                    ),
                    Text(
                      value,
                      style: AppTextStyles.ts14_400.copyWith(
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                    ),
                  ],
                ),
              ),
              Transform.rotate(
                angle: isOpen ? pi : 0,
                child: Image.asset(
                  'assets/png/arrow_down.png',
                  width: 24.r,
                  height: 24.r,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
