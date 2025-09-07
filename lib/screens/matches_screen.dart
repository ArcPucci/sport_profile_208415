import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/utils/utils.dart';

import '../widgets/widgets.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 16.h),
          SizedBox(
            width: 358.w,
            child: Row(
              children: [
                CustomIconButton(iconPath: 'assets/png/menu.png'),
                SizedBox(width: 16.w),
                CustomContainer(
                  width: 97.w,
                  height: 40.h,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/png/filter.png',
                        width: 16.r,
                        height: 16.r,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: 8.w),
                      Opacity(
                        opacity: 0.4,
                        child: Text("Filters", style: AppTextStyles.ts14_400),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CreateButton(),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          CustomMatchesTab(selected: 0, onChanged: (tab) => print(tab)),
          SizedBox(height: 18.h),
          SizedBox(
            width: 358.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [PopupUnderButton(), CustomDateButton()],
            ),
          ),
          SizedBox(height: 12.h),
          WeekCalendar(),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: 32.h, bottom: 200.h),
              itemBuilder: (context, index) {
                return Center(child: MatchCard());
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.h);
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
