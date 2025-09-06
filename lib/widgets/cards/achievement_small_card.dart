import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/models/models.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class AchievementSmallCard extends StatelessWidget {
  const AchievementSmallCard({super.key, required this.achievement});

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 135.w,
      height: 160.h,
      child: Column(
        children: [
          Image.asset(
            achievement.cup.asset,
            width: 135.w,
            height: 93.h,
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
          ),
          Spacer(),
          Text(
            achievement.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.ts14_600.copyWith(
              color: achievement.cup.color,
            ),
          ),
          Text(
            achievement.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.ts12_400.copyWith(
              color: Colors.white.withValues(alpha: 0.6),
              height: 1,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
