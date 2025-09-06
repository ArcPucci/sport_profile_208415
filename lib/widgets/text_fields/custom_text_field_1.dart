import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class CustomTextField1 extends StatelessWidget {
  const CustomTextField1({
    super.key,
    required this.title,
    this.icon = '',
    this.controller,
    this.hasIcon = true,
    this.maxLength = 18,
  });

  final int? maxLength;
  final String title;
  final String icon;
  final bool hasIcon;
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
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            if (hasIcon) ...[
              Image.asset(
                icon,
                width: 20.r,
                height: 20.r,
                color: AppTheme.green,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 16.w),
            ],
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
                    controller: controller,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(maxLength),
                    ],
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
          ],
        ),
      ),
    );
  }
}
