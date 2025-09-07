import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

import '../utils/utils.dart';

class ProfilesMenuDrawer extends StatefulWidget {
  const ProfilesMenuDrawer({super.key});

  @override
  State<ProfilesMenuDrawer> createState() => _ProfilesMenuDrawerState();
}

class _ProfilesMenuDrawerState extends State<ProfilesMenuDrawer>
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
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 20,
                            color: Colors.black.withValues(alpha: 0.5),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: SafeArea(
                        child: Column(
                          children: [
                            SizedBox(height: 12.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 2.h),
                                  child: Text(
                                    "Menu",
                                    style: AppTextStyles.ts20_600,
                                  ),
                                ),
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
                            Expanded(
                              child: SingleChildScrollView(
                                padding: EdgeInsets.only(top: 24.h),
                                child: Column(
                                  children: List.generate(2, (index) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 16.h),
                                      child: Container(
                                        width: 225.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 1.sp,
                                              color: AppTheme.grey,
                                            ),
                                          ),
                                        ),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Player #1",
                                          style: AppTextStyles.ts16_500,
                                        ),
                                      ),
                                    );
                                  }),
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
    return CustomIconButton(
      iconPath: 'assets/png/menu.png',
      onTap: _showDrawer,
    );
  }
}
