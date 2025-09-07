import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: InnerShadowRRectPainter(
        blur: 20,
        borderRadius: 20,
        color: Colors.black.withAlpha(50),
      ),
      child: Container(
        width: 358.w,
        height: 132.h,
        decoration: BoxDecoration(
          gradient: AppTheme.blackGradient,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1.sp, color: Colors.white.withAlpha(1)),
          boxShadow: [
            BoxShadow(blurRadius: 41, color: Colors.white.withAlpha(4)),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 326.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 16.r),
                        Text(
                          "20.09.2025, 10:00 AM",
                          style: AppTextStyles.ts14_400,
                        ),
                        Opacity(
                          opacity: 0.6,
                          child: Image.asset(
                            'assets/png/dot_menu.png',
                            width: 16.r,
                            height: 16.r,
                            color: Colors.white,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(width: 326.w, height: 1.sp, color: AppTheme.grey),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: 358.w,
                    child: Center(
                      child: SizedBox(
                        width: 326.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 115.w,
                              child: Row(
                                children: [
                                  CustomIconButton(
                                    size: 32.r,
                                    iconSize: 16.r,
                                    iconPath: 'assets/png/eagles.png',
                                    borderRadius: 32,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text("Eagles", style: AppTextStyles.ts14_400),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                TeamScore(),
                                SizedBox(width: 1),
                                TeamScore(),
                              ],
                            ),
                            SizedBox(
                              width: 115.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Eagles", style: AppTextStyles.ts14_400),
                                  SizedBox(width: 8.w),
                                  CustomIconButton(
                                    size: 32.r,
                                    iconSize: 16.r,
                                    iconPath: 'assets/png/eagles.png',
                                    borderRadius: 32,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: 326.w,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 202.w,
                        height: 1.sp,
                        color: AppTheme.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/png/blue_rect.png',
                    width: 140.r,
                    height: 28.r,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.r),
                    child: Text(
                      "Official match",
                      style: AppTextStyles.ts12_400.copyWith(
                        color: AppTheme.blue2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
