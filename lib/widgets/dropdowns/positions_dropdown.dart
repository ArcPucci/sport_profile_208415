import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/utils/utils.dart';

import '../widgets.dart';

class PositionsDropdown extends StatelessWidget {
  const PositionsDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return FancyDropdown<String>(
      value: 'QB',
      items: [
        CustomPopupMenuItem(value: 'QB', label: "QB"),
        CustomPopupMenuItem(value: 'QB', label: "QB"),
        CustomPopupMenuItem(value: 'QB', label: "QB"),
        CustomPopupMenuItem(value: 'QB', label: "QB"),
        CustomPopupMenuItem(value: 'QB', label: "QB"),
      ],
      onChanged: (String value) {},
      itemBuilder: (context, item, isSelected) {
        return Container(
          width: 358.w,
          height: 64.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          alignment: Alignment.centerLeft,
          child: Text(item.value, style: AppTextStyles.ts14_500),
        );
      },
      childBuilder: (context, value, isOpen) {
        return CustomSelector(
          title: "Position",
          icon: 'assets/png/puzzle.png',
          value: value,
        );
      },
    );
  }
}
