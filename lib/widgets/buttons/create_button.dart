import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: InnerShadowRRectPainter(
          blur: 40,
          color: Colors.white.withAlpha(4),
        ),
        child: Container(
          width: 105.w,
          height: 40.r,
          decoration: BoxDecoration(
            gradient: AppTheme.blackGradient,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 20,
                color: Colors.black.withValues(alpha: 0.5),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/png/plus2.png',
                width: 16.r,
                height: 16.r,
                fit: BoxFit.fill,
              ),
              Text("Create", style: AppTextStyles.ts14_600),
            ],
          ),
        ),
      ),
    );
  }
}
