import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/models/models.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({super.key, required this.achievement, this.onAchieve});

  final Achievement achievement;
  final VoidCallback? onAchieve;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 358.w,
      height: 107.h,
      child: Row(
        children: [
          Stack(
            children: [
              Image.asset(
                achievement.cup.asset,
                width: 135.h,
                height: 107.h,
                fit: BoxFit.fill,
              ),
              Positioned(
                right: 3.h,
                bottom: 3.h,
                child: Text(
                  "${achievement.xp}xp",
                  style: AppTextStyles.ts14_600.copyWith(
                    color: achievement.cup.color,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: SizedBox(
              height: 87.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.r,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        achievement.title,
                        style: AppTextStyles.ts14_600.copyWith(
                          color: AppTheme.green,
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.6,
                    child: Text(
                      achievement.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.ts12_400,
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: InkWell(
                      onTap: onAchieve,
                      child: CustomContainer(
                        width: 191.w,
                        height: 34.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (achievement.isAchieved) ...[
                              Image.asset(
                                'assets/png/tick.png',
                                width: 16.r,
                                height: 16.r,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(width: 8.w),
                              Text("Achieved", style: AppTextStyles.ts14_600),
                            ],
                            if (!achievement.isAchieved)
                              Text(
                                "Achieve",
                                style: AppTextStyles.ts14_600.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
