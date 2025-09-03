import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.iconPath, this.onTap});

  final String iconPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.r,
        height: 40.r,
        decoration: BoxDecoration(
          gradient: AppTheme.blackGradient,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            width: 1.sp,
            color: Colors.white.withValues(alpha: 0.01),
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
        child: Image.asset(
          iconPath,
          width: 24.r,
          height: 24.r,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
