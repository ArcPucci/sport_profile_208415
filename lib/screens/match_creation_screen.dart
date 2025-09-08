import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sport_profile_208415/models/models.dart';
import 'package:sport_profile_208415/providers/providers.dart';
import 'package:sport_profile_208415/utils/utils.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

class MatchCreationScreen extends StatefulWidget {
  const MatchCreationScreen({super.key, this.isEdit = false});

  final bool isEdit;

  @override
  State<MatchCreationScreen> createState() => _MatchCreationScreenState();
}

class _MatchCreationScreenState extends State<MatchCreationScreen> {
  late final MatchesProvider _matchesProvider;

  MatchType _matchType = matchTypes.first;
  DateTime _dateTime = DateTime.now();

  final durationController = TextEditingController();
  final teamAController = TextEditingController();
  final scoreAController = TextEditingController();
  final teamBController = TextEditingController();
  final scoreBController = TextEditingController();

  List<int> stats = List.generate((16), (index) => 125);

  int _step = 0;

  @override
  void initState() {
    super.initState();
    _matchesProvider = Provider.of(context, listen: false);
    if (widget.isEdit) {
      final match = _matchesProvider.matchModel;
      _matchType = match.matchType;
      _dateTime = match.created;
      durationController.text = match.duration.toString();
      teamAController.text = match.teamA;
      scoreAController.text = match.scoreA.toString();
      teamBController.text = match.teamB;
      scoreBController.text = match.scoreB.toString();
      stats = List.from(match.stats);
    }
  }

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
                  selected: matchType.id == _matchType.id,
                  matchType: matchType,
                  onTap: () => setState(() => _matchType = matchType),
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
            dateTime: _dateTime,
            onDateSelected: (date) => setState(() => _dateTime = date),
          ),
          SizedBox(height: 16.h),
          CustomTextField2(
            title: 'Duration',
            suffix: 'min',
            icon: 'assets/png/sandclock.png',
            controller: durationController,
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
                  controller: teamAController,
                ),
                CustomTextField1(
                  title: 'Score A',
                  width: 171.w,
                  icon: 'assets/png/hashtag.png',
                  maxLength: 3,
                  formatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),
                  ],
                  controller: scoreAController,
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
                  controller: teamBController,
                ),
                CustomTextField1(
                  title: 'Score B',
                  width: 171.w,
                  icon: 'assets/png/hashtag.png',
                  maxLength: 3,
                  formatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),
                  ],
                  controller: scoreBController,
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
                    children: List.generate(personalData.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: SkillCounter(
                          title: personalData[index],
                          value: stats[index],
                          onIncrease: () => onIncrease(index),
                          onDecrease: () => onDecrease(index),
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
      if (widget.isEdit) {
        MatchModel match = _matchesProvider.matchModel;
        match = match.copyWith(
          matchType: _matchType,
          created: _dateTime,
          duration: int.parse(durationController.text.trim()),
          teamA: teamAController.text.trim(),
          scoreA: int.parse(scoreAController.text.trim()),
          teamB: teamBController.text.trim(),
          scoreB: int.parse(scoreBController.text.trim()),
          stats: stats,
        );

        _matchesProvider.saveMatch(match);
      } else {
        MatchModel match = MatchModel(
          id: 0,
          profileId: _matchesProvider.selectedProfile,
          matchType: _matchType,
          created: _dateTime,
          duration: int.parse(durationController.text.trim()),
          teamA: teamAController.text.trim(),
          scoreA: int.parse(scoreAController.text.trim()),
          teamB: teamBController.text.trim(),
          scoreB: int.parse(scoreBController.text.trim()),
          stats: stats,
        );

        _matchesProvider.createMatch(match);
      }

      context.pop();
      return;
    }

    final duration = durationController.text.trim();
    final teamA = teamAController.text.trim();
    final scoreA = scoreAController.text.trim();
    final teamB = teamBController.text.trim();
    final scoreB = scoreBController.text.trim();

    if (_step == 1 &&
        (duration.isEmpty ||
            teamA.isEmpty ||
            scoreA.isEmpty ||
            teamB.isEmpty ||
            scoreB.isEmpty)) {
      return;
    }

    _step++;
    setState(() {});
  }

  void onIncrease(int index) {
    if (stats[index] < 250) {
      stats[index]++;
    }
    setState(() {});
  }

  void onDecrease(int index) {
    if (stats[index] > 0) {
      stats[index]--;
    }
    setState(() {});
  }
}
