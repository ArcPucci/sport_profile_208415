import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class MatchesStatsCard extends StatelessWidget {
  const MatchesStatsCard({
    super.key,
    required this.matches,
    required this.won,
    required this.lost,
    required this.draw,
  });

  final int matches;
  final int won;
  final int lost;
  final int draw;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 358.w,
      height: 148.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 16.h,
            left: 16.w,
            child: Text("Matches", style: AppTextStyles.ts14_500),
          ),
          Positioned(
            top: 31.h,
            right: 16.w,
            child: Container(width: 211.w, height: 1.sp, color: AppTheme.grey),
          ),
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 24.h,
            height: 76.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text("$matches", style: AppTextStyles.ts40_600),
                  ),
                ),
                SizedBox(
                  width: 232.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 35.w,
                            child: Text("Won", style: AppTextStyles.ts12_400),
                          ),
                          CustomIndicator(
                            percent: matches == 0 ? 0 : won / matches,
                            width: 185.w,
                            height: 8.h,
                            color: AppTheme.green4,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 35.w,
                            child: Text("Lost", style: AppTextStyles.ts12_400),
                          ),
                          CustomIndicator(
                            percent: matches == 0 ? 0 : lost / matches,
                            width: 185.w,
                            height: 8.h,
                            color: AppTheme.pink,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 35.w,
                            child: Text("Draw", style: AppTextStyles.ts12_400),
                          ),
                          CustomIndicator(
                            percent: matches == 0 ? 0 : draw / matches,
                            width: 185.w,
                            height: 8.h,
                            color: AppTheme.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
