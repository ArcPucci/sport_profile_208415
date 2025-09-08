import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

import '../utils/utils.dart';

class FiltersRow extends StatelessWidget {
  const FiltersRow({
    super.key,
    required this.filters,
    required this.onDelete,
    this.onReset,
  });

  final List<String> filters;
  final void Function(String) onDelete;
  final VoidCallback? onReset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 358.w,
      child: Wrap(
        spacing: 8.w,
        runSpacing: 8.h,
        children: [
          for (var item in filters)
            CustomContainer(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(item, style: AppTextStyles.ts14_400),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () => onDelete.call(item),
                    child: Image.asset(
                      'assets/png/close.png',
                      width: 16.r,
                      height: 16.r,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          GestureDetector(
            onTap: onReset,
            child: CustomContainer(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/png/trash.png',
                    width: 16.r,
                    height: 16.r,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 8.w),
                  Text("Reset All", style: AppTextStyles.ts14_600),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
