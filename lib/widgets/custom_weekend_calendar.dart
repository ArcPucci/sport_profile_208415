import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/utils/utils.dart';
import 'package:sport_profile_208415/widgets/inner_shadow_box.dart';

class WeekCalendar extends StatefulWidget {
  const WeekCalendar({
    super.key,
    required this.dateTime,
    required this.onChanged,
  });

  final DateTime dateTime;
  final void Function(DateTime date) onChanged;

  @override
  State<WeekCalendar> createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalendar> {
  late DateTime _currentWeekStart;

  @override
  void initState() {
    super.initState();
    _currentWeekStart = _getStartOfWeek(widget.dateTime);
  }

  @override
  didUpdateWidget(covariant WeekCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _currentWeekStart = _getStartOfWeek(widget.dateTime);
  }

  DateTime _getStartOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  List<DateTime> _getDaysOfWeek() {
    return List.generate(
      7,
      (index) => _currentWeekStart.add(Duration(days: index)),
    );
  }

  void _goToPreviousWeek() {
    setState(() {
      _currentWeekStart = _currentWeekStart.subtract(const Duration(days: 7));
    });
  }

  void _goToNextWeek() {
    setState(() {
      _currentWeekStart = _currentWeekStart.add(const Duration(days: 7));
    });
  }

  @override
  Widget build(BuildContext context) {
    final days = _getDaysOfWeek();
    return SizedBox(
      width: 358.w,
      height: 54.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _circleButton(pi / 2, _goToPreviousWeek),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: days.map((date) {
              final isSelected =
                  date.day == widget.dateTime.day &&
                  date.month == widget.dateTime.month &&
                  date.year == widget.dateTime.year;

              return GestureDetector(
                onTap: () => widget.onChanged.call(date),
                child: Container(
                  width: 37.w,
                  height: 42.h,
                  color: Colors.transparent,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (isSelected)
                        FittedBox(
                          fit: BoxFit.none,
                          child: CustomPaint(
                            painter: InnerShadowRRectPainter(
                              blur: 8,
                              borderRadius: 999,
                              color: AppTheme.red.withAlpha(10),
                            ),
                            child: Container(
                              width: 54.r,
                              height: 54.r,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.red.withAlpha(5),
                              ),
                            ),
                          ),
                        ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Opacity(
                            opacity: 0.4,
                            child: Text(
                              date.shortWeek,
                              style: AppTextStyles.ts10_400.copyWith(
                                color: isSelected ? AppTheme.red : null,
                              ),
                            ),
                          ),
                          Text(
                            "${date.day}",
                            style: AppTextStyles.ts14_600.copyWith(
                              color: isSelected ? null : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          _circleButton(-pi / 2, _goToNextWeek),
        ],
      ),
    );
  }

  Widget _circleButton(double angle, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: InnerShadowRRectPainter(
          blur: 12,
          borderRadius: 999,
          color: Colors.white.withAlpha(2),
        ),
        child: Container(
          width: 40.r,
          height: 40.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppTheme.blackGradient,
            border: Border.all(width: 2.sp, color: Colors.white.withAlpha(1)),
          ),
          alignment: Alignment.center,
          child: Transform.rotate(
            angle: angle,
            child: Image.asset(
              'assets/png/arrow_down.png',
              width: 24.r,
              height: 24.r,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
