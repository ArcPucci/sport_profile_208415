import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/models/models.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class CustomSelector2 extends StatelessWidget {
  const CustomSelector2({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    this.isOpen = false,
  });

  final bool isOpen;
  final String title;
  final String icon;
  final Nationality value;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
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
                  Row(
                    children: [
                      Image.asset(
                        value.asset,
                        width: 27.r,
                        height: 14.r,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: 8.w),
                      Text(value.name, style: AppTextStyles.ts14_400),
                    ],
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
    );
  }
}
