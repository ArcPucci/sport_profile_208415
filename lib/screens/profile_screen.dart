import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sport_profile_208415/providers/providers.dart';
import 'package:sport_profile_208415/utils/utils.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AchievementsProvider, ProfilesProvider>(
      builder: (BuildContext context, value, value2, Widget? child) {
        return Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 56.h),
                child: Column(
                  children: [
                    SafeArea(
                      bottom: false,
                      child: ProfileCard(profile: value2.profile),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      width: 358.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Achievements", style: AppTextStyles.ts20_600),
                          GestureDetector(
                            onTap: () => context.go('/achievements'),
                            child: Text(
                              "See All",
                              style: AppTextStyles.ts14_600.copyWith(
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                                decorationColor: AppTheme.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 22.h),
                    SizedBox(
                      height: 160.h,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              OverallScoreCard(
                                xp: value.allXP,
                                achieved: value.achievedAchievementsCount,
                                allAchievements: value.allAchievementsCount,
                              ),
                              SizedBox(width: 16.w),
                              Row(
                                children: List.generate(
                                  value.openAchievements.length,
                                  (index) {
                                    final achievement =
                                        value.openAchievements[index];
                                    return AchievementSmallCard(
                                      achievement: achievement,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    SizedBox(
                      width: 358.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Skills", style: AppTextStyles.ts20_600),
                          EditButton2(onTap: () => context.go('/skillsEdit')),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SkillsChart(stats: value2.profile.stats),
                    SizedBox(height: 500.h),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 16.h,
              left: 16.w,
              right: 16.w,
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfilesMenuDrawer(),
                    EditButton(onTap: () => context.go('/edit')),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
