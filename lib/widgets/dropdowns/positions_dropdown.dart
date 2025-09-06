import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/utils/utils.dart';

import '../widgets.dart';

class PositionsDropdown extends StatelessWidget {
  const PositionsDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String value;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return FancyDropdown<String>(
      value: value,
      items: [
        CustomPopupMenuItem(value: 'QB', label: "QB"),
        CustomPopupMenuItem(value: 'RB', label: "RB"),
        CustomPopupMenuItem(value: 'HB', label: "HB"),
        CustomPopupMenuItem(value: 'FB', label: "FB"),
        CustomPopupMenuItem(value: 'WR', label: "WR"),
        CustomPopupMenuItem(value: 'TE', label: "TE"),
        CustomPopupMenuItem(value: 'OL', label: "OL"),
        CustomPopupMenuItem(value: 'C', label: "C"),
        CustomPopupMenuItem(value: 'OG', label: "OG"),
        CustomPopupMenuItem(value: 'OT', label: "OT"),
        CustomPopupMenuItem(value: 'DL', label: "DL"),
        CustomPopupMenuItem(value: 'DT', label: "DT"),
        CustomPopupMenuItem(value: 'NT', label: "DE"),
        CustomPopupMenuItem(value: 'LB', label: "MLB"),
        CustomPopupMenuItem(value: 'OLB', label: "OLB"),
        CustomPopupMenuItem(value: 'DB', label: "DB"),
        CustomPopupMenuItem(value: 'CB', label: "CB"),
        CustomPopupMenuItem(value: 'S', label: "S"),
        CustomPopupMenuItem(value: 'FS', label: "FS"),
        CustomPopupMenuItem(value: 'SS', label: "SS"),
      ],
      onChanged: onChanged,
      itemBuilder: (context, item, isSelected) {
        return Container(
          width: 358.w,
          height: 64.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          alignment: Alignment.centerLeft,
          child: Text(
            item.value,
            style: AppTextStyles.ts14_500.copyWith(
              color: value == item.value ? AppTheme.green : null,
            ),
          ),
        );
      },
      childBuilder: (context, value, isOpen) {
        return CustomSelector(
          title: "Position",
          icon: 'assets/png/puzzle.png',
          isOpen: isOpen,
          value: value,
        );
      },
    );
  }
}
