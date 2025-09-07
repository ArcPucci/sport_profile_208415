import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/utils/utils.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key, this.onDelete});

  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: CustomPaint(
            painter: InnerShadowRRectPainter(
              blur: 41,
              color: Colors.white.withValues(alpha: 0.04),
            ),
            child: Container(
              width: 357.w,
              height: 202.h,
              decoration: BoxDecoration(
                gradient: AppTheme.blackGradient,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1.sp,
                  color: Colors.white.withAlpha(1),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 20,
                    color: Colors.black.withAlpha(50),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 24.r),
                      Text("Confirmation", style: AppTextStyles.ts20_600),
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
                  Text(
                    "Are you sure that you want to delete this card?",
                    style: AppTextStyles.ts14_400,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: Navigator.of(context).pop,
                        child: CustomPaint(
                          painter: InnerShadowRRectPainter(
                            blur: 41,
                            borderRadius: 14,
                            color: Colors.white.withValues(alpha: 0.04),
                          ),
                          child: Container(
                            width: 150.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              gradient: AppTheme.blackGradient,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                width: 1.sp,
                                color: Colors.white.withAlpha(1),
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
                            child: Text(
                              "Cancel",
                              style: AppTextStyles.ts14_600,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          onDelete?.call();
                        },
                        child: CustomPaint(
                          painter: InnerShadowRRectPainter(
                            blur: 41,
                            borderRadius: 14,
                            color: Colors.white.withValues(alpha: 0.04),
                          ),
                          child: Container(
                            width: 150.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: AppTheme.pink.withAlpha(5),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                width: 1.sp,
                                color: Colors.white.withAlpha(1),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 5),
                                  blurRadius: 20,
                                  color: Colors.black.withAlpha(50),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/png/trash.png',
                                  width: 16.r,
                                  height: 16.r,
                                  color: AppTheme.pink,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "Delete",
                                  style: AppTextStyles.ts14_600.copyWith(
                                    color: AppTheme.pink,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
