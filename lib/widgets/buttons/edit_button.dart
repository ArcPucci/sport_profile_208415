import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 131.w,
        height: 40.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: AppTheme.blackGradient,
          border: Border.all(
            width: 1.sp,
            color: Colors.white.withValues(alpha: 0.01),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/png/pen.png',
              width: 16.r,
              height: 16.r,
              fit: BoxFit.fill,
            ),
            Text("Edit profile", style: AppTextStyles.ts14_600),
          ],
        ),
      ),
    );
  }
}
