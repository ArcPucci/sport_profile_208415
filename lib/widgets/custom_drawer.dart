import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

import '../utils/utils.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: CustomPaint(
        painter: InnerShadowRRectPainter(
          blur: 40,
          color: Colors.white.withAlpha(4),
        ),
        child: Container(
          width: 273.w,
          height: 844.h,
          decoration: BoxDecoration(
            gradient: AppTheme.blackGradient,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 20,
                color: Colors.black.withValues(alpha: 0.5),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Text("Menu", style: AppTextStyles.ts20_600),
                    ),
                    GestureDetector(
                      onTap: Navigator.of(context).pop,
                      child: Image.asset(
                        'assets/png/close.png',
                        width: 24.r,
                        height: 24.r,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 24.h),
                    child: Column(
                      children: List.generate(2, (index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: Container(
                            width: 225.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.sp,
                                  color: AppTheme.grey,
                                ),
                              ),
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Player #1",
                              style: AppTextStyles.ts16_500,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
