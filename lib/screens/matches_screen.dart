import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
                ProfilesMenuDrawer(),
                SizedBox(width: 16.w),
                FiltersDrawer(),
                Spacer(),
                CreateButton(onTap: () => '/matches/create'),
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
                return Center(
                  child: MatchCard(onTap: () => context.go('/matches/info')),
                );
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
