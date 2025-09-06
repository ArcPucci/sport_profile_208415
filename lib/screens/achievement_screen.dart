import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sport_profile_208415/providers/providers.dart';
import 'package:sport_profile_208415/utils/utils.dart';

import '../widgets/widgets.dart';

class AchievementScreen extends StatefulWidget {
  const AchievementScreen({super.key});

  @override
  State<AchievementScreen> createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final xpController = TextEditingController();
  int _selectedCup = -1;

  late final AchievementsProvider _achievementsProvider;

  @override
  void initState() {
    super.initState();
    _achievementsProvider = Provider.of(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SafeArea(
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
                        style: AppTextStyles.ts14_600.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 40.r),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                CustomTextField1(
                  title: 'Title',
                  hasIcon: false,
                  controller: titleController,
                ),
                SizedBox(height: 16.h),
                CustomTextField1(
                  title: 'Description',
                  maxLength: 32,
                  hasIcon: false,
                  controller: descriptionController,
                ),
                SizedBox(height: 16.h),
                CustomTextField2(
                  title: 'Xp amount',
                  hasIcon: false,
                  suffix: 'xp',
                  controller: xpController,
                ),
                SizedBox(height: 16.h),
                CustomContainer(
                  width: 358.w,
                  height: 147.h,
                  padding: EdgeInsets.only(
                    top: 16.h,
                    left: 16.w,
                    right: 16.w,
                    bottom: 25.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                        opacity: 0.4,
                        child: Text("Cup", style: AppTextStyles.ts12_400),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(cupTypes.length, (index) {
                          final cup = cupTypes[index];
                          return Opacity(
                            opacity: _selectedCup == index ? 1 : 0.4,
                            child: GestureDetector(
                              onTap: () => setState(() => _selectedCup = index),
                              child: Image.asset(
                                cup.asset,
                                width: 72.r,
                                height: 72.r,
                                alignment: Alignment.topCenter,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                LabeledButton2(title: "Save", onTap: onSave),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void onSave() {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();
    final xp = xpController.text.trim();

    if (_selectedCup == -1 ||
        title.isEmpty ||
        description.isEmpty ||
        xp.isEmpty) {
      return;
    }

    _achievementsProvider.createAchievement(
      titleController.text,
      descriptionController.text,
      int.parse(xpController.text),
      cupTypes[_selectedCup],
    );

    clearAll();
  }

  void clearAll() {
    titleController.clear();
    descriptionController.clear();
    xpController.clear();
    setState(() => _selectedCup = -1);
  }
}
