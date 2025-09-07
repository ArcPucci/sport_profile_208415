import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class LabeledButton2 extends StatelessWidget {
  const LabeledButton2({
    super.key,
    required this.title,
    this.width,
    this.height,
    this.onTap,
    this.textColor,
    this.borderRadius,
    this.bgColor,
  });

  final Color? bgColor;
  final double? borderRadius;
  final String title;
  final double? width;
  final double? height;
  final Color? textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        bgColor: bgColor,
        borderRadius: borderRadius,
        width: width ?? 342.w,
        height: height ?? 64.h,
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.ts14_600.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
