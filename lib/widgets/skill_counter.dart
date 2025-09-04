import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

import '../utils/utils.dart';

class SkillCounter extends StatelessWidget {
  const SkillCounter({
    super.key,
    required this.title,
    required this.value,
    this.onIncrease,
    this.onDecrease,
  });

  final String title;
  final int value;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: InnerShadowRRectPainter(
        blur: 40,
        color: Colors.white.withAlpha(4),
      ),
      child: Container(
        width: 358.w,
        height: 72.h,
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
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              iconPath: 'assets/png/minus.png',
              borderRadius: 999,
              onTap: onDecrease,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyles.ts12_400.copyWith(
                    color: Colors.white.withValues(alpha: 0.4),
                  ),
                ),
                SizedBox(height: 2.h),
                Text("$value", style: AppTextStyles.ts14_400),
              ],
            ),
            CustomIconButton(
              iconPath: 'assets/png/plus.png',
              borderRadius: 999,
              onTap: onIncrease,
            ),
          ],
        ),
      ),
    );
  }
}
