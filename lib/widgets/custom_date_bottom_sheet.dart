import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class CustomDateBottomSheet extends StatefulWidget {
  const CustomDateBottomSheet({
    super.key,
    this.initialDate,
    required this.onDateSelected,
  });

  final DateTime? initialDate;
  final void Function(DateTime date) onDateSelected;

  @override
  State<CustomDateBottomSheet> createState() => _CustomDateBottomSheetState();
}

class _CustomDateBottomSheetState extends State<CustomDateBottomSheet> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _dateTime = widget.initialDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 250.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        gradient: AppTheme.blackGradient,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 250.h,
            child: CupertinoTheme(
              data: CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: AppTextStyles.ts14_400,
                ),
              ),
              child: CupertinoDatePicker(
                initialDateTime: _dateTime,
                mode: CupertinoDatePickerMode.dateAndTime,
                onDateTimeChanged: (date) => _dateTime = date,
              ),
            ),
          ),
          Positioned(
            top: 16.h,
            right: 24.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                widget.onDateSelected(_dateTime);
              },
              child: Text(
                "Save",
                style: AppTextStyles.ts14_600.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
