import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

import '../../utils/utils.dart';

class OverallScoreCard extends StatelessWidget {
  const OverallScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWithInnerShadow(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Column(
        children: [
          Opacity(
            opacity: 0.4,
            child: Text("Overall Score", style: AppTextStyles.ts12_500),
          ),
          SizedBox(height: 12.h),
          Text("150", style: AppTextStyles.ts40_700),
          Text("xp", style: AppTextStyles.ts16_600),
          Spacer(),
          SizedBox(height: 2.h),
          Opacity(
            opacity: 0.4,
            child: Text("10/25", style: AppTextStyles.ts12_500),
          ),
          Container(
            width: 119.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1.sp,
                color: Colors.white.withValues(alpha: 0.01),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: CustomPaint(
              painter: InnerShadowRRectPainter(
                blur: 4,
                offset: Offset(0, 4),
                color: Colors.white.withAlpha(25),
              ),
              child: CustomPaint(
                painter: InnerShadowRRectPainter(
                  blur: 12,
                  offset: Offset(0, -4),
                  color: Colors.black.withAlpha(15),
                ),
                child: Container(
                  width: 61.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: AppTheme.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
