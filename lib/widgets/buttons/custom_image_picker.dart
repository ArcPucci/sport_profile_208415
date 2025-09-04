import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class CustomImagePicker extends StatelessWidget {
  const CustomImagePicker({super.key, required this.text});

  final String text;

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
        alignment: Alignment.center,
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            color: Colors.white.withAlpha(40),
            radius: Radius.circular(20),
            strokeWidth: 1.sp,
            dashPattern: [6, 6],
          ),
          child: SizedBox(
            width: 342.w,
            height: 56.h,
            child: Center(
              child: Opacity(
                opacity: 0.2,
                child: Text(text, style: AppTextStyles.ts14_400),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
