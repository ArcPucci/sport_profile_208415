import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

import '../utils/utils.dart';

class ContactDialog extends StatelessWidget {
  const ContactDialog({super.key});

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
              height: 382.h,
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
                      Text("Contact us", style: AppTextStyles.ts20_600),
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
                  SizedBox(height: 16.h),
                  Text(
                    "Leave your message and our support team will contact you shortly",
                    style: AppTextStyles.ts14_400,
                  ),
                  SizedBox(height: 10.h),
                  CustomContainer(
                    width: 309.w,
                    height: 144.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.h,
                        horizontal: 16.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Opacity(
                            opacity: 0.4,
                            child: Text(
                              "Message",
                              style: AppTextStyles.ts12_400,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              maxLines: null,
                              style: AppTextStyles.ts14_400,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration.collapsed(
                                hintText: 'Leave your message',
                                hintStyle: AppTextStyles.ts14_400.copyWith(
                                  color: Colors.white.withAlpha(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: Navigator.of(context).pop,
                    child: CustomPaint(
                      painter: InnerShadowRRectPainter(
                        blur: 41,
                        borderRadius: 14,
                        color: Colors.white.withValues(alpha: 0.04),
                      ),
                      child: Container(
                        width: 309.w,
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
                        child: Text("Send", style: AppTextStyles.ts14_600),
                      ),
                    ),
                  ),
                  SizedBox(height: 22.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
