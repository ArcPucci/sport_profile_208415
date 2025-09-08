import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sport_profile_208415/services/services.dart';
import 'package:sport_profile_208415/utils/utils.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final asset in assets) {
        precacheImage(AssetImage(asset), context);
      }
    });
  }

  final assets = [
    "assets/png/onboarding1.png",
    "assets/png/onboarding2.png",
    "assets/png/onboarding3.png",
  ];

  final titles = [
    "Personal Game Stats",
    "Match Day Schedule",
    "Detailed Match Info",
  ];

  final subTitles = [
    "Easily track your game progress",
    "Save and view all upcoming games",
    "Keep every play and highlight recorded",
  ];

  @override
  Widget build(BuildContext context) {
    final lastPage = _currentPage == assets.length - 1;
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (value) => setState(() => _currentPage = value),
              children: List.generate(assets.length, (index) {
                final asset = assets[index];
                final title = titles[index];
                final subTitle = subTitles[index];
                return _buildBody(title, subTitle, asset);
              }),
            ),
          ),
          Positioned(
            top: 22.h,
            child: SafeArea(child: CustomPageIndicator(selected: _currentPage)),
          ),
          Positioned(
            bottom: 24.h,
            child: SafeArea(
              child: LabeledButton1(
                label: lastPage ? "Continue" : "Next",
                onTap: next,
              ),
            ),
          ),
          if (!lastPage)
            Positioned(
              top: 16.h,
              right: 16.w,
              child: SafeArea(
                child: GestureDetector(
                  onTap: skip,
                  child: Text(
                    "Skip",
                    style: AppTextStyles.ts14_600.copyWith(
                      color: Colors.white.withValues(alpha: 0.4),
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white.withValues(alpha: 0.4),
                      decorationThickness: 2,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBody(String title, String subTitle, String asset) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(child: Image.asset(asset, fit: BoxFit.cover)),
        Positioned(
          top: 76.h,
          child: SafeArea(
            child: Column(
              children: [
                Text(title, style: AppTextStyles.ts20_600),
                SizedBox(height: 2.h),
                Opacity(
                  opacity: 0.6,
                  child: Text(subTitle, style: AppTextStyles.ts14_400),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void next() {
    if (_currentPage == assets.length - 1) {
      context.read<ConfigService>().setFirstInit();
      context.go('/');
      return;
    }

    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void skip() {
    pageController.animateToPage(
      assets.length - 1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
