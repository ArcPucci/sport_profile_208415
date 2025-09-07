import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_profile_208415/utils/utils.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

class MatchInfoScreen extends StatelessWidget {
  const MatchInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 80.h),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  CustomTextField1(
                    title: "Date",
                    icon: 'assets/png/calendar2.png',
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
                  SizedBox(height: 16.h),
                  CustomTextField1(title: 'Type', icon: 'assets/png/award.png'),
                  SizedBox(height: 32.h),
                  SizedBox(
                    width: 358.w,
                    child: Text(
                      "Additional Info",
                      style: AppTextStyles.ts16_500.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: 358.w,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        mainAxisExtent: 72.h,
                      ),
                      itemBuilder: (context, index) {
                        return CustomContainer(
                          width: 171.w,
                          height: 72.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Opacity(
                                opacity: 0.4,
                                child: Text(
                                  "Touchdowns",
                                  style: AppTextStyles.ts12_400,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text("125", style: AppTextStyles.ts14_400),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 100.h),
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
                  "More Info",
                  style: AppTextStyles.ts14_600.copyWith(color: Colors.white),
                ),
                ActionsMenu(
                  onEdit: () => context.go('/matches/info/edit'),
                  onDelete: () => showConfirmation(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showConfirmation(BuildContext context) {
    showDialog(context: context, builder: (context) => ConfirmationDialog());
  }
}
