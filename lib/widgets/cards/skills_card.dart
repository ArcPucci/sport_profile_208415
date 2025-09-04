import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/radar_chart_painter.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class SkillsCard extends StatelessWidget {
  const SkillsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: InnerShadowRRectPainter(
        blur: 40,
        color: Colors.white.withAlpha(4),
      ),
      child: Container(
        width: 358.w,
        height: 288.h,
        decoration: BoxDecoration(
          gradient: AppTheme.blackGradient,
          borderRadius: BorderRadius.circular(20),
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
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 25.h),
        child: CustomPaint(
          size: Size(358.w, 288.h),
          painter: RadarChartPainter(
            features: ["SPD", "STA", "DEF", "SHT", "PAS"],
            values: [35, 30, 20, 15, 25],
            ticks: 5,
            maxValue: 50,
          ),
        ),
      ),
    );
  }
}
