import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sport_profile_208415/providers/providers.dart';
import 'package:sport_profile_208415/utils/utils.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

class SkillsEditScreen extends StatefulWidget {
  const SkillsEditScreen({super.key});

  @override
  State<SkillsEditScreen> createState() => _SkillsEditScreenState();
}

class _SkillsEditScreenState extends State<SkillsEditScreen> {
  late final ProfilesProvider _profilesProvider;
  List<int> stats = [0, 0, 0, 0, 0];

  final list = ["Speed", "Stamina", "Defense", "Shooting", "Passing"];

  @override
  void initState() {
    super.initState();
    _profilesProvider = context.read<ProfilesProvider>();
    stats = List.from(_profilesProvider.profile.stats);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 64.h),
            child: Column(
              children: [
                SafeArea(
                  bottom: false,
                  child: SkillsChart(stats: stats),
                ),
                SizedBox(height: 24.h),
                Column(
                  children: List.generate(list.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: SkillCounter(
                        title: list[index],
                        value: stats[index],
                        onIncrease: () => increaseStat(index),
                        onDecrease: () => decreaseStat(index),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 24.h),
                LabeledButton2(
                  title: 'Save',
                  width: 358.w,
                  onTap: () async {
                    _profilesProvider.updateStats(stats);
                    context.pop();
                  },
                ),
              ],
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
                  "Skills",
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

  void increaseStat(int index) {
    if (stats[index] < 250) stats[index]++;
    setState(() {});
  }

  void decreaseStat(int index) {
    if (stats[index] == 0) return;
    stats[index]--;
    setState(() {});
  }
}
