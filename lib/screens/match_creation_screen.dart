import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_profile_208415/utils/utils.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

class MatchCreationScreen extends StatefulWidget {
  const MatchCreationScreen({super.key, this.isEdit = false});

  final bool isEdit;

  @override
  State<MatchCreationScreen> createState() => _MatchCreationScreenState();
}

class _MatchCreationScreenState extends State<MatchCreationScreen> {
  int _step = 0;

  @override
  Widget build(BuildContext context) {
    return _step == 0
        ? _buildBody1()
        : _step == 1
        ? _buildBody2()
        : _buildBody3();
  }

  Widget _buildBody1() {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 16.h),
          SizedBox(
            width: 358.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  iconPath: 'assets/png/back.png',
                  onTap: context.pop,
                ),
                Text(
                  widget.isEdit ? "Match Editing" : "Match Creation",
                  style: AppTextStyles.ts14_600.copyWith(color: Colors.white),
                ),
                SizedBox(width: 40.r),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Column(
            children: List.generate(matchTypes.length, (index) {
              final matchType = matchTypes[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: MatchTypeCard(
                  selected: index == 0,
                  matchType: matchType,
                ),
              );
            }),
          ),
          Spacer(),
          LabeledButton2(
            title: 'Next Step',
            width: 358.w,
            borderRadius: 20,
            onTap: onNext,
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildBody2() {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 16.h),
          SizedBox(
            width: 358.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  iconPath: 'assets/png/back.png',
                  onTap: context.pop,
                ),
                Text(
                  "General Data",
                  style: AppTextStyles.ts14_600.copyWith(color: Colors.white),
                ),
                SizedBox(width: 40.r),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          CustomCalendarButton(
            dateTime: DateTime.now(),
            onDateSelected: (date) {},
          ),
          SizedBox(height: 16.h),
          CustomTextField2(
            title: 'Duration',
            suffix: 'min',
            icon: 'assets/png/sandclock.png',
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: 358.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextField1(
                  title: 'Team A',
                  width: 171.w,
                  icon: 'assets/png/ball2.png',
                ),
                CustomTextField1(
                  title: 'Score A',
                  width: 171.w,
                  icon: 'assets/png/hashtag.png',
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: 358.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextField1(
                  title: 'Team B',
                  width: 171.w,
                  icon: 'assets/png/ball2.png',
                ),
                CustomTextField1(
                  title: 'Score B',
                  width: 171.w,
                  icon: 'assets/png/hashtag.png',
                ),
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            width: 358.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabeledButton2(
                  title: 'Back',
                  width: 171.w,
                  borderRadius: 20,
                  onTap: onBack,
                ),
                LabeledButton2(
                  title: 'Next Step',
                  width: 171.w,
                  borderRadius: 20,
                  onTap: onNext,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildBody3() {
    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 80.h),
            child: SafeArea(
              child: Column(
                children: [
                  Column(
                    children: List.generate(15, (index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: SkillCounter(
                          title: 'index $index',
                          value: 125,
                          onIncrease: () {},
                          onDecrease: () {},
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 11.h),
                  SizedBox(
                    width: 358.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabeledButton2(
                          title: 'Back',
                          width: 171.w,
                          borderRadius: 20,
                          onTap: onBack,
                        ),
                        LabeledButton2(
                          title: 'Save',
                          width: 171.w,
                          borderRadius: 20,
                          bgColor: AppTheme.red.withValues(alpha: 0.1),
                          onTap: onNext,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 16.h,
          left: 16.w,
          right: 16.w,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  iconPath: 'assets/png/back.png',
                  onTap: context.pop,
                ),
                Text(
                  "Personal Data",
                  style: AppTextStyles.ts14_600.copyWith(color: Colors.white),
                ),
                SizedBox(width: 40.r),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void onBack() {
    _step--;
    setState(() {});
  }

  void onNext() {
    if (_step == 2) {
      return;
    }

    _step++;
    setState(() {});
  }
}
