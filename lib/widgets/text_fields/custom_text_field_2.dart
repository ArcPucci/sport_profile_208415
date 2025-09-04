import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class CustomTextField2 extends StatelessWidget {
  const CustomTextField2({
    super.key,
    required this.title,
    required this.icon,
    this.controller,
    required this.suffix,
  });

  final String title;
  final String icon;
  final String suffix;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: InnerShadowRRectPainter(
        blur: 40,
        borderRadius: 20,
        color: Colors.white.withAlpha(4),
      ),
      child: Container(
        width: 358.w,
        height: 72.h,
        decoration: BoxDecoration(
          gradient: AppTheme.blackGradient,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1.sp, color: Colors.white.withAlpha(1)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 20,
              color: Colors.black.withAlpha(50),
            ),
          ],
        ),
        padding: EdgeInsets.only(left: 16.w),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 20.r,
              height: 20.r,
              color: AppTheme.green,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: 0.4,
                    child: Text(title, style: AppTextStyles.ts12_500),
                  ),
                  TextField(
                    style: AppTextStyles.ts14_400,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Type here...',
                      hintStyle: AppTextStyles.ts14_400.copyWith(
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 55.w,
              height: 72.h,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.03),
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(20),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                suffix,
                style: AppTextStyles.ts12_400.copyWith(
                  color: Colors.white.withValues(alpha: 0.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
