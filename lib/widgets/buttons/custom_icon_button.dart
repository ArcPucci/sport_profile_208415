import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/inner_shadow_box.dart';

import '../../utils/utils.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.iconPath,
    this.onTap,
    this.borderRadius,
    this.size,
    this.iconSize,
  });

  final double? size;
  final double? iconSize;
  final String iconPath;
  final double? borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: InnerShadowRRectPainter(
          blur: 40,
          borderRadius: borderRadius ?? 14,
          color: Colors.white.withAlpha(4),
        ),
        child: Container(
          width: size ?? 40.r,
          height: size ?? 40.r,
          decoration: BoxDecoration(
            gradient: AppTheme.blackGradient,
            borderRadius: BorderRadius.circular(borderRadius ?? 14),
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
            width: iconSize ?? 24.r,
            height: iconSize ?? 24.r,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
