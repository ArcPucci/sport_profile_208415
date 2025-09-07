import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class CustomCalendarButton extends StatelessWidget {
  const CustomCalendarButton({
    super.key,
    required this.dateTime,
    required this.onDateSelected,
  });

  final DateTime dateTime;
  final void Function(DateTime date) onDateSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showModalBottomSheet(context),
      child: CustomContainer(
        width: 358.w,
        height: 72.h,
        borderRadius: 20,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            Image.asset(
              'assets/png/calendar.png',
              width: 20.r,
              height: 20.r,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 16.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                  opacity: 0.4,
                  child: Text("Date", style: AppTextStyles.ts12_400),
                ),
                SizedBox(height: 2.h),
                Text(dateTime.shortDate, style: AppTextStyles.ts14_400),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CustomDateBottomSheet(
          initialDate: dateTime,
          onDateSelected: onDateSelected,
        );
      },
    );
  }
}
