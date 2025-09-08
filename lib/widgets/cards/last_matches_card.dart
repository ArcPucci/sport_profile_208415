import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class LastMatchesCard extends StatelessWidget {
  const LastMatchesCard({super.key, required this.stats});

  final List<int> stats;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 358.w,
      height: 108.h,
      child: Stack(
        children: [
          Positioned(
            top: 16.h,
            left: 16.w,
            child: Text("Last 7 matches", style: AppTextStyles.ts14_500),
          ),
          Positioned(
            top: 31.h,
            right: 16.w,
            child: Container(width: 211.w, height: 1.sp, color: AppTheme.grey),
          ),
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 16.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(7, (index) {
                if (stats.length - 1 > index) {
                  if (stats[index] == 1) {
                    return Container(
                      width: 40.r,
                      height: 40.r,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/png/state1.png'),
                          fit: BoxFit.fill,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 20,
                            color: Colors.black.withValues(alpha: 0.5),
                          ),
                        ],
                      ),
                    );
                  }

                  return Container(
                    width: 40.r,
                    height: 40.r,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/png/state2.png'),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 20,
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                      ],
                    ),
                  );
                }
                return Container(
                  width: 40.r,
                  height: 40.r,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/png/state1.png'),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 20,
                        color: Colors.black.withValues(alpha: 0.5),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
