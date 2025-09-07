import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../utils/utils.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key, required this.path});

  final String path;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    final selected = getSelected();
    return Container(
      width: 358.w,
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage('assets/png/nav_bar_bg.png'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 20,
            color: Colors.black.withValues(alpha: 0.5),
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 11.h, bottom: 8.h),
      child: Row(
        children: List.generate(navBarItems.length, (index) {
          final item = navBarItems[index];
          final isSelected = index == selected;
          return Expanded(
            child: InkWell(
              onTap: () => context.go(item.path),
              child: Opacity(
                opacity: isSelected ? 1 : 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 46.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            item.asset,
                            width: 24.r,
                            height: 24.r,
                            color: isSelected ? AppTheme.green : null,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            item.title,
                            style: AppTextStyles.ts12_600.copyWith(
                              color: isSelected ? null : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isSelected)
                      Container(
                        width: 8.r,
                        height: 8.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.green,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  int getSelected() {
    for (int i = navBarItems.length - 1; i >= 0; i--) {
      if (navBarItems[i].path == widget.path) return i;
    }

    return 0;
  }
}
