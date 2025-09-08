import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/models/models.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class NationalitiesDropdown extends StatelessWidget {
  const NationalitiesDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final Nationality value;
  final void Function(Nationality) onChanged;

  @override
  Widget build(BuildContext context) {
    return FancyDropdown<Nationality>(
      value: value,
      items: List.generate(nationalities.length, (index) {
        final value = nationalities[index];
        return CustomPopupMenuItem(value: value, label: value.name);
      }),
      onChanged: onChanged,
      itemBuilder: (context, item, isSelected) {
        return Container(
          width: 358.w,
          height: 64.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Image.asset(
                item.value.asset,
                width: 27.r,
                height: 14.r,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 8.w),
              Text(
                item.label,
                style: AppTextStyles.ts14_500.copyWith(
                  color: value == item.value ? AppTheme.green : null,
                ),
              ),
            ],
          ),
        );
      },
      childBuilder: (context, value, isOpen) {
        return CustomSelector2(
          title: "Nationality",
          icon: 'assets/png/flag.png',
          isOpen: isOpen,
          value: value,
        );
      },
    );
  }
}
