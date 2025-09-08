import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/models/models.dart';

import '../../utils/utils.dart';

class MatchTypeCard extends StatelessWidget {
  const MatchTypeCard({
    super.key,
    required this.matchType,
    this.selected = false,
    this.onTap,
  });

  final bool selected;
  final MatchType matchType;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 358.w,
        height: 88.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(matchType.bigRect),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(50),
              blurRadius: 20,
              offset: Offset(0, 5),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            Image.asset(
              selected ? 'assets/png/circle1.png' : 'assets/png/circle.png',
              width: 24.r,
              height: 24.r,
              color: matchType.color,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 16.w),
            Text(
              matchType.name,
              style: AppTextStyles.ts16_500.copyWith(color: matchType.color),
            ),
          ],
        ),
      ),
    );
  }
}
