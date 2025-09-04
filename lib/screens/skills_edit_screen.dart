import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_profile_208415/utils/utils.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

class SkillsEditScreen extends StatelessWidget {
  const SkillsEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 64.h),
            child: Column(
              children: [
                SafeArea(bottom: false, child: SkillsChart()),
                SizedBox(height: 24.h),
                Column(
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: SkillCounter(title: "Speed", value: 125),
                    );
                  }),
                ),
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
                  iconPath: 'assets/png/back.png',
                  onTap: context.pop,
                ),
                Text(
                  "Skills",
                  style: AppTextStyles.ts14_600.copyWith(color: Colors.white),
                ),
                SizedBox(width: 40.r),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
