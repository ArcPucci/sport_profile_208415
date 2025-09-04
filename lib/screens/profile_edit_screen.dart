import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_profile_208415/utils/utils.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 56.h),
            child: Column(
              children: [
                SafeArea(bottom: false, child: ProfileCard()),
                SizedBox(height: 16.h),
                CustomImagePicker(text: "Upload profile image"),
                SizedBox(height: 16.h),
                CustomTextField1(title: 'Name', icon: 'assets/png/profile.png'),
                SizedBox(height: 16.h),
                PositionsDropdown(),
                SizedBox(height: 16.h),
                CustomTextField1(title: 'Age', icon: 'assets/png/calendar.png'),
                SizedBox(height: 16.h),
                CustomSelector2(
                  title: 'Nationality',
                  icon: 'assets/png/flag.png',
                  value: 'USA',
                ),
                SizedBox(height: 16.h),
                CustomTextField2(
                  title: 'Height',
                  icon: 'assets/png/profile.png',
                  suffix: 'cm',
                ),
                SizedBox(height: 16.h),
                CustomTextField2(
                  title: 'Weight',
                  icon: 'assets/png/profile.png',
                  suffix: 'kg',
                ),
                SizedBox(height: 24.h),
                Container(
                  width: 358.w,
                  height: 1.sp,
                  color: Colors.white.withValues(alpha: 0.2),
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: 358.w,
                  child: Text("Team Parameters", style: AppTextStyles.ts20_600),
                ),
                SizedBox(height: 16.h),
                CustomImagePicker(text: "Upload team logo"),
                SizedBox(height: 16.h),
                CustomTextField1(
                  title: 'Team Name',
                  icon: 'assets/png/profile.png',
                ),
                SizedBox(height: 40.h),
                CustomPaint(
                  painter: InnerShadowRRectPainter(
                    blur: 40,
                    borderRadius: 20,
                    color: Colors.white.withAlpha(4),
                  ),
                  child: Container(
                    width: 358.w,
                    height: 64.h,
                    decoration: BoxDecoration(
                      gradient: AppTheme.blackGradient,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 1.sp,
                        color: Colors.white.withValues(alpha: 0.01),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 20,
                          color: Colors.black.withAlpha(50),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text("Save", style: AppTextStyles.ts14_600),
                  ),
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
                  "Match Creation",
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
