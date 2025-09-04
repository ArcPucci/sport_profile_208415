import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_profile_208415/utils/utils.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 56.h),
            child: Column(
              children: [
                SafeArea(child: ProfileCard()),
                SizedBox(height: 32.h),
                SizedBox(
                  width: 358.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Achievements", style: AppTextStyles.ts20_600),
                      Text(
                        "See All",
                        style: AppTextStyles.ts14_600.copyWith(
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          decorationColor: AppTheme.red,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 22.h),
                SizedBox(
                  height: 160.h,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        OverallScoreCard(),
                        SizedBox(width: 16.w),
                      ],
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
                      EditButton2(),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                SkillsCard(),
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
                CustomIconButton(
                  iconPath: 'assets/png/menu.png',
                  onTap: Scaffold.of(context).openDrawer,
                ),
                EditButton(onTap: () => context.go('/edit')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
