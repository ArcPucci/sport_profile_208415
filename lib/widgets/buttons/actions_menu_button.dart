import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';

class ActionsMenuButton extends StatelessWidget {
  const ActionsMenuButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  final String text;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 159.w,
        height: 20.h,
        color: Colors.transparent,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 20.r,
              height: 20.r,
              color: Colors.white,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 8.w),
            Text(text, style: AppTextStyles.ts14_400),
          ],
        ),
      ),
    );
  }
}
