import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

import '../utils/utils.dart';

class CustomAchievementsTab extends StatefulWidget {
  const CustomAchievementsTab({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final int selected;
  final void Function(int) onChanged;

  @override
  State<CustomAchievementsTab> createState() => _CustomAchievementsTabState();
}

class _CustomAchievementsTabState extends State<CustomAchievementsTab> {
  final list = ["Open", "Achieved"];

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 358.w,
      height: 40.h,
      child: Row(
        children: List.generate(2, (index) {
          return Expanded(
            child: InkWell(
              onTap: () => widget.onChanged.call(index),
              child: Center(
                child: Text(
                  list[index],
                  style: widget.selected == index
                      ? AppTextStyles.ts14_600.copyWith(color: AppTheme.green)
                      : AppTextStyles.ts14_400.copyWith(
                          color: Colors.white.withValues(alpha: 0.3),
                        ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
