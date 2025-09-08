import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sport_profile_208415/providers/providers.dart';
import 'package:sport_profile_208415/utils/utils.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 80.h),
                child: SafeArea(
                  child: Column(
                    children: [
                      LastMatchesCard(stats: value.matchResults),
                      SizedBox(height: 16.h),
                      MatchesStatsCard(
                        matches: value.matchesCount,
                        won: value.wins,
                        lost: value.lost,
                        draw: value.draw,
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: 358.w,
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: statsList.length,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 14.w,
                                mainAxisSpacing: 16.h,
                                mainAxisExtent: 148.h,
                              ),
                          itemBuilder: (context, index) {
                            final stat = statsList[index];
                            return Container(
                              width: 172.w,
                              height: 148.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(stat.bg),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 16.h,
                                    left: 16.w,
                                    child: Text(
                                      stat.name,
                                      style: AppTextStyles.ts14_500,
                                    ),
                                  ),
                                  Positioned(
                                    top: 61.h,
                                    left: 26.w,
                                    child: Text(
                                      "${value.stats[index]}",
                                      style: AppTextStyles.ts40_600,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 100.h),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16.h,
              left: 16.w,
              child: SafeArea(child: ProfilesMenuDrawer()),
            ),
          ],
        );
      },
    );
  }
}
