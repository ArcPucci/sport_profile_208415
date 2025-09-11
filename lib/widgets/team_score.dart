import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

import '../utils/utils.dart';

class TeamScore extends StatelessWidget {
  const TeamScore({super.key, this.score});

  final int? score;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: InnerShadowRRectPainter(
        blur: 9,
        borderRadius: 8,
        color: Colors.white.withAlpha(2),
      ),
      child: Container(
        width: 40.w,
        height: 32.h,
        decoration: BoxDecoration(
          gradient: AppTheme.blackGradient,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1.sp, color: Colors.white.withAlpha(1)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 8,
              color: Colors.black.withAlpha(40),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            score?.toString() ?? "-",
            style: AppTextStyles.ts16_500.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
