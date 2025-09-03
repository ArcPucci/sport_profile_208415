import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';
import 'clippers/clippers.dart';

class ShieldBox extends StatelessWidget {
  const ShieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390.w,
      height: 355.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.translate(
            offset: Offset(7, 7),
            child: ClipPath(
              clipper: ShieldClipper(),
              child: Container(
                width: 242.w,
                height: 328.h,
                color: Colors.black.withValues(alpha: 0.35),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: ClipPath(
              clipper: ShieldClipper(),
              child: Container(
                width: 242.w,
                height: 328.h,
                decoration: BoxDecoration(gradient: AppTheme.blackGradient),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
