import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              SizedBox(height: 56.h),
              SafeArea(child: ProfileCard()),
            ],
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
                CustomIconButton(iconPath: 'assets/png/menu.png'),
                EditButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
