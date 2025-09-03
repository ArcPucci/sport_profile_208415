import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({super.key, required this.selected});

  final int selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 62.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(3, (index) {
          final active = index == selected;
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: active ? 38.r : 8.r,
            height: 8.r,
            decoration: BoxDecoration(
              color: active
                  ? AppTheme.green
                  : Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
          );
        }),
      ),
    );
  }
}
