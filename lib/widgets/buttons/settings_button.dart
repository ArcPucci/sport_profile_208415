import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
    this.iconColor,
  });

  final Color? iconColor;
  final String icon;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        width: 358.w,
        height: 56.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 20.r,
              height: 20.r,
              fit: BoxFit.fill,
              color: iconColor,
            ),
            SizedBox(width: 16.w),
            Text(text, style: AppTextStyles.ts14_400),
            Spacer(),
            Image.asset(
              'assets/png/arrow_right.png',
              width: 24.r,
              height: 24.r,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
