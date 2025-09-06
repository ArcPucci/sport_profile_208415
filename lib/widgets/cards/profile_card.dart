import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/utils/utils.dart';

import '../../models/models.dart';
import '../widgets.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final name = profile.name ?? "NAME";
    final position = profile.pos ?? "";
    final age = profile.age ?? '';
    final nationalityID = profile.nat ?? -1;
    final nationality = Nationality.empty();
    final teamName = profile.teamName ?? "TEAM NAME";
    final height = profile.height ?? '';
    final weight = profile.weight ?? '';
    final teamLogo = profile.teamLogo;

    final path = profile.image;

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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: path == null
                          ? AssetImage('assets/png/avatar.png')
                          : FileImage(File(path)),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      teamLogo == null
                          ? Image.asset(
                              'assets/png/ball.png',
                              width: 54.r,
                              height: 28.r,
                              fit: BoxFit.fill,
                            )
                          : Image.file(
                              File(teamLogo),
                              width: 54.r,
                              height: 28.r,
                              fit: BoxFit.cover,
                            ),
                      Image.asset(
                        nationality.asset,
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
                SizedBox(
                  width: 163.w,
                  child: Center(
                    child: Text(
                      name,
                      style: AppTextStyles.ts18_600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
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
                                  Text(position, style: AppTextStyles.ts14_700),
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
                                  Text("$age", style: AppTextStyles.ts14_700),
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
                                    nationality.asset,
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
                                          "HT",
                                          style: AppTextStyles.ts14_700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    "$height",
                                    style: AppTextStyles.ts14_700,
                                  ),
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
                                          "WT",
                                          style: AppTextStyles.ts14_700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    "$weight",
                                    style: AppTextStyles.ts14_700,
                                  ),
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
                                          "TM",
                                          style: AppTextStyles.ts14_700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  teamLogo == null
                                      ? Image.asset(
                                          'assets/png/ball.png',
                                          width: 27.r,
                                          height: 14.r,
                                          fit: BoxFit.fill,
                                        )
                                      : Image.file(
                                          File(teamLogo),
                                          width: 27.r,
                                          height: 14.r,
                                          fit: BoxFit.cover,
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
