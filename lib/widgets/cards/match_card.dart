import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/models/models.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({
    super.key,
    this.onTap,
    required this.matchModel,
    this.onEdit,
    this.onDelete,
  });

  final MatchModel matchModel;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
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
                            matchModel.created.fullFormat,
                            style: AppTextStyles.ts14_400,
                          ),
                          ActionsMenu2(onEdit: onEdit, onDelete: onDelete),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(width: 326.w, height: 1.sp, color: AppTheme.grey),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: 358.w,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          if (matchModel.isOver &&
                              matchModel.scoreA >= matchModel.scoreB)
                            Positioned(
                              left: 0,
                              child: Container(
                                width: 139.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white.withAlpha(5),
                                      Colors.white.withAlpha(0),
                                    ],
                                  ),
                                  border: Border(
                                    left: BorderSide(
                                      width: 2.sp,
                                      color: AppTheme.green,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (matchModel.isOver &&
                              matchModel.scoreA <= matchModel.scoreB)
                            Positioned(
                              right: 0,
                              child: Container(
                                width: 139.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white.withAlpha(0),
                                      Colors.white.withAlpha(5),
                                    ],
                                  ),
                                  border: Border(
                                    right: BorderSide(
                                      width: 2.sp,
                                      color: AppTheme.green,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(
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
                                        iconPath: 'assets/png/ball4.png',
                                        borderRadius: 32,
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        matchModel.teamA,
                                        style: AppTextStyles.ts14_400,
                                      ),
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
                                      Text(
                                        matchModel.teamB,
                                        style: AppTextStyles.ts14_400,
                                      ),
                                      SizedBox(width: 8.w),
                                      CustomIconButton(
                                        size: 32.r,
                                        iconSize: 16.r,
                                        iconPath: 'assets/png/ball4.png',
                                        borderRadius: 32,
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
                      matchModel.matchType.smallRect,
                      width: 140.r,
                      height: 28.r,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.r),
                      child: Text(
                        matchModel.matchType.name,
                        style: AppTextStyles.ts12_400.copyWith(
                          color: matchModel.matchType.color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
