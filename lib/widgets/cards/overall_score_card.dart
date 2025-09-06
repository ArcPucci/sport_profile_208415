import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

import '../../utils/utils.dart';

class OverallScoreCard extends StatelessWidget {
  const OverallScoreCard({
    super.key,
    required this.xp,
    required this.achieved,
    required this.allAchievements,
  });

  final int xp;
  final int achieved;
  final int allAchievements;

  @override
  Widget build(BuildContext context) {
    final percent = allAchievements > 0 ? achieved / allAchievements : 0.0;
    return ContainerWithInnerShadow(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Column(
        children: [
          Opacity(
            opacity: 0.4,
            child: Text("Overall Score", style: AppTextStyles.ts12_500),
          ),
          SizedBox(height: 12.h),
          Text("$xp", style: AppTextStyles.ts40_700),
          Text("xp", style: AppTextStyles.ts16_600),
          Spacer(),
          SizedBox(height: 2.h),
          Opacity(
            opacity: 0.4,
            child: Text(
              "$achieved/$allAchievements",
              style: AppTextStyles.ts12_500,
            ),
          ),
          CustomIndicator(
            percent: percent,
            width: 119.w,
            height: 8.h,
            borderRadius: 20,
          ),
        ],
      ),
    );
  }
}
