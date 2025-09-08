import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

import '../utils/utils.dart';

class PopupUnderButton extends StatefulWidget {
  const PopupUnderButton({
    super.key,
    required this.onChanged,
    required this.dateTime,
  });

  final DateTime dateTime;
  final void Function(int, int) onChanged;

  @override
  State<PopupUnderButton> createState() => _PopupUnderButtonState();
}

class _PopupUnderButtonState extends State<PopupUnderButton> {
  int _year = DateTime.now().year;

  final list = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  final GlobalKey _buttonKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _showPopup() {
    final RenderBox button =
        _buttonKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final Offset offset = button.localToGlobal(Offset.zero, ancestor: overlay);

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          ModalBarrier(
            color: Colors.transparent,
            dismissible: true,
            onDismiss: _hidePopup,
          ),
          Positioned(
            left: offset.dx,
            top: offset.dy + button.size.height + 5,
            child: Material(
              color: Colors.transparent,
              child: CustomPaint(
                painter: InnerShadowRRectPainter(
                  color: Colors.white.withValues(alpha: 0.04),
                ),
                child: StatefulBuilder(
                  builder:
                      (
                        BuildContext context,
                        void Function(void Function()) setState,
                      ) {
                        return Container(
                          width: 224.w,
                          decoration: BoxDecoration(
                            gradient: AppTheme.blackGradient,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1.sp,
                              color: Colors.white.withAlpha(1),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.5),
                                blurRadius: 20,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 16.h,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildCircle(pi / 2, () {
                                    if (_year <= 2015) return;
                                    setState(() => _year--);
                                  }),
                                  Text("$_year", style: AppTextStyles.ts14_400),
                                  _buildCircle(-pi / 2, () {
                                    if (_year >= 2035) return;
                                    setState(() => _year++);
                                  }),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              Container(
                                width: 192.w,
                                height: 1.sp,
                                color: AppTheme.grey,
                              ),
                              SizedBox(height: 16.h),
                              ListView.separated(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      _hidePopup();
                                      widget.onChanged.call(_year, index + 1);
                                    },
                                    child: Text(
                                      list[index],
                                      style: AppTextStyles.ts14_400,
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 10.h);
                                },
                                itemCount: list.length,
                              ),
                            ],
                          ),
                        );
                      },
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hidePopup() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _buttonKey,
      onTap: () {
        if (_overlayEntry == null) {
          _showPopup();
        } else {
          _hidePopup();
        }
      },
      child: Row(
        children: [
          Text(widget.dateTime.monthAndYear, style: AppTextStyles.ts14_400),
          SizedBox(width: 8.w),
          Image.asset(
            'assets/png/arrow_down.png',
            width: 16.r,
            height: 16.r,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  Widget _buildCircle(double angle, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: InnerShadowRRectPainter(
          blur: 7,
          borderRadius: 24,
          color: Colors.white.withAlpha(2),
        ),
        child: Container(
          width: 24.r,
          height: 24.r,
          decoration: BoxDecoration(
            gradient: AppTheme.blackGradient,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(width: 1.sp, color: Colors.white.withAlpha(2)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 6,
                color: Colors.black.withAlpha(40),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Transform.rotate(
            angle: angle,
            child: Image.asset(
              'assets/png/arrow_down.png',
              width: 16.r,
              height: 16.r,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
