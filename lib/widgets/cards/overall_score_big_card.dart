import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class OverallScoreBigCard extends StatelessWidget {
  const OverallScoreBigCard({
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
    return CustomContainer(
      width: 358.w,
      height: 107.h,
      child: Row(
        children: [
          SizedBox(
            width: 135.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15.r),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text("$xp", style: AppTextStyles.ts40_700),
                    ),
                  ),
                ),
                Text("xp", style: AppTextStyles.ts16_600),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10.r, bottom: 20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: 0.4,
                    child: Text("Overall Score", style: AppTextStyles.ts12_500),
                  ),
                  SizedBox(height: 8.r),
                  Text(
                    "$achieved/$allAchievements",
                    style: AppTextStyles.ts14_600.copyWith(
                      color: AppTheme.green2,
                    ),
                  ),
                  Spacer(),
                  CustomIndicator(percent: percent),
                ],
              ),
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }
}
