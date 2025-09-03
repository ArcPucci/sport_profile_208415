import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/utils/utils.dart';

import '../widgets.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ShieldBox(),
        Positioned(
          top: 22.h,
          child: ClipPath(
            clipper: ProfileImageClipper(),
            child: SizedBox(
              width: 242.w,
              height: 328.h,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 227.w,
                  height: 166.h,
                  color: Colors.green,
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/png/eagle.png',
                        width: 54.r,
                        height: 28.r,
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'assets/png/usa.png',
                        width: 54.r,
                        height: 28.r,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 195.h,
          child: Container(
            width: 183.w,
            height: 108.h,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Column(
              children: [
                Text("NAME", style: AppTextStyles.ts18_600),
                Container(
                  width: 163.w,
                  height: 67.h,
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 1.sp,
                        color: AppTheme.green,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 75.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 21.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("QB", style: AppTextStyles.ts14_700),
                                  SizedBox(width: 4.w),
                                  Opacity(
                                    opacity: 0.6,
                                    child: SizedBox(
                                      width: 35.r,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "POS",
                                          style: AppTextStyles.ts14_700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 21.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("18", style: AppTextStyles.ts14_700),
                                  SizedBox(width: 4.w),
                                  Opacity(
                                    opacity: 0.6,
                                    child: SizedBox(
                                      width: 35.r,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "AGE",
                                          style: AppTextStyles.ts14_700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 21.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    'assets/png/usa.png',
                                    width: 27.r,
                                    height: 14.r,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(width: 4.w),
                                  Opacity(
                                    opacity: 0.6,
                                    child: SizedBox(
                                      width: 35.r,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "NAT",
                                          style: AppTextStyles.ts14_700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 1.sp,
                        height: 60.h,
                        color: AppTheme.green,
                      ),
                      SizedBox(
                        width: 75.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 21.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Opacity(
                                    opacity: 0.6,
                                    child: SizedBox(
                                      width: 35.r,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "POS",
                                          style: AppTextStyles.ts14_700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Text("176", style: AppTextStyles.ts14_700),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 21.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Opacity(
                                    opacity: 0.6,
                                    child: SizedBox(
                                      width: 35.r,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "AGE",
                                          style: AppTextStyles.ts14_700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Text("67", style: AppTextStyles.ts14_700),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 21.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Opacity(
                                    opacity: 0.6,
                                    child: SizedBox(
                                      width: 35.r,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "NAT",
                                          style: AppTextStyles.ts14_700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Image.asset(
                                    'assets/png/eagle.png',
                                    width: 27.r,
                                    height: 14.r,
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
