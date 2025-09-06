import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sport_profile_208415/providers/providers.dart';
import 'package:sport_profile_208415/utils/utils.dart';

import '../widgets/widgets.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<AchievementsProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 144.h),
                child: _selected == 0
                    ? _buildOpenAchievements(value)
                    : _buildAchievedAchievements(value),
              ),
            ),
            Positioned(
              top: 16.h,
              left: 16.w,
              right: 16.w,
              child: SafeArea(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomIconButton(
                              iconPath: 'assets/png/back.png',
                              onTap: context.pop,
                            ),
                            CreateButton(
                              onTap: () => context.go('/achievements/create'),
                            ),
                          ],
                        ),
                        Text(
                          "Achievements",
                          style: AppTextStyles.ts14_600.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    CustomAchievementsTab(
                      selected: _selected,
                      onChanged: (tab) => setState(() => _selected = tab),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOpenAchievements(AchievementsProvider value) {
    return Column(
      children: [
        SafeArea(
          bottom: false,
          child: OverallScoreBigCard(
            xp: value.allXP,
            achieved: value.achievedAchievementsCount,
            allAchievements: value.allAchievementsCount,
          ),
        ),
        SizedBox(height: 16.h),
        Column(
          children: List.generate(value.openAchievements.length, (index) {
            final achievement = value.openAchievements[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: AchievementCard(
                achievement: achievement,
                onAchieve: () => value.completeAchievement(achievement),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildAchievedAchievements(AchievementsProvider value) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: List.generate(value.achievedAchievements.length, (index) {
          final achievement = value.achievedAchievements[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: AchievementCard(achievement: achievement),
          );
        }),
      ),
    );
  }

  void updateAchievements(tab) {
    if (tab == _selected) return;
    setState(() => _selected = tab);
  }
}
