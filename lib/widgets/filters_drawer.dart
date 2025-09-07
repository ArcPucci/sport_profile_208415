import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

import '../utils/utils.dart';

class FiltersDrawer extends StatefulWidget {
  const FiltersDrawer({super.key});

  @override
  State<FiltersDrawer> createState() => _FiltersDrawerState();
}

class _FiltersDrawerState extends State<FiltersDrawer>
    with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _animation = Tween(
      begin: const Offset(-1.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _showDrawer() {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Material(
          type: MaterialType.transparency,
          child: Stack(
            children: [
              GestureDetector(
                onTap: _hideDrawer,
                child: Container(color: Colors.black54),
              ),
              SlideTransition(
                position: _animation,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomPaint(
                    painter: InnerShadowRRectPainter(
                      blur: 41,
                      borderRadius: 20,
                      color: Colors.white.withValues(alpha: 0.04),
                    ),
                    child: Container(
                      width: 273.w,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: AppTheme.blackGradient,
                        border: Border.all(
                          width: 1.sp,
                          color: Colors.white.withAlpha(1),
                        ),
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 20,
                            color: Colors.black.withAlpha(50),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Filter", style: AppTextStyles.ts20_600),
                                GestureDetector(
                                  onTap: _hideDrawer,
                                  child: Image.asset(
                                    'assets/png/close.png',
                                    width: 24.r,
                                    height: 24.r,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              "Type",
                              style: AppTextStyles.ts16_500.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Column(
                              children: List.generate(3, (index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: AppTheme.blackGradient,
                                      border: Border.all(
                                        width: 1.sp,
                                        color: Colors.white.withAlpha(1),
                                      ),
                                      borderRadius: BorderRadius.circular(14),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 5),
                                          blurRadius: 20,
                                          color: Colors.black.withAlpha(50),
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                      vertical: 10.h,
                                    ),
                                    child: Text(
                                      "Friendly match",
                                      style: AppTextStyles.ts14_400,
                                    ),
                                  ),
                                );
                              }),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              "Victory",
                              style: AppTextStyles.ts16_500.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Column(
                              children: List.generate(3, (index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: AppTheme.blackGradient,
                                      border: Border.all(
                                        width: 1.sp,
                                        color: Colors.white.withAlpha(1),
                                      ),
                                      borderRadius: BorderRadius.circular(14),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 5),
                                          blurRadius: 20,
                                          color: Colors.black.withAlpha(50),
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                      vertical: 10.h,
                                    ),
                                    child: Text(
                                      "Friendly match",
                                      style: AppTextStyles.ts14_400,
                                    ),
                                  ),
                                );
                              }),
                            ),
                            Spacer(),
                            CustomPaint(
                              painter: InnerShadowRRectPainter(
                                blur: 41,
                                color: Colors.white.withValues(alpha: 0.04),
                              ),
                              child: Container(
                                width: 225.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  gradient: AppTheme.blackGradient,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    width: 1.sp,
                                    color: Colors.white.withAlpha(1),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 5),
                                      blurRadius: 20,
                                      color: Colors.black.withAlpha(50),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/png/trash.png',
                                      width: 16.r,
                                      height: 16.r,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      "Reset All",
                                      style: AppTextStyles.ts14_600,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
    _controller.forward();
  }

  void _hideDrawer() async {
    await _controller.reverse();
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDrawer,
      child: CustomContainer(
        width: 97.w,
        height: 40.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/png/filter.png',
              width: 16.r,
              height: 16.r,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 8.w),
            Opacity(
              opacity: 0.4,
              child: Text("Filters", style: AppTextStyles.ts14_400),
            ),
          ],
        ),
      ),
    );
  }
}
