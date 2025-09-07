import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

import '../utils/utils.dart';

class ActionsMenu extends StatefulWidget {
  const ActionsMenu({super.key, this.onEdit, this.onDelete});

  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  State<ActionsMenu> createState() => _ActionsMenuState();
}

class _ActionsMenuState extends State<ActionsMenu> {
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
            top: offset.dy + button.size.height + 5,
            right: 16.w,
            child: Material(
              color: Colors.transparent,
              child: CustomPaint(
                painter: InnerShadowRRectPainter(
                  color: Colors.white.withValues(alpha: 0.04),
                ),
                child: Container(
                  width: 191.w,
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
                      ActionsMenuButton(
                        text: "Edit",
                        icon: 'assets/png/pen.png',
                        onTap: () {
                          _hidePopup();
                          widget.onEdit?.call();
                        },
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        width: 192.w,
                        height: 1.sp,
                        color: AppTheme.grey,
                      ),
                      SizedBox(height: 16.h),
                      ActionsMenuButton(
                        text: "Delete",
                        icon: 'assets/png/trash.png',
                        onTap: () {
                          _hidePopup();
                          widget.onDelete?.call();
                        },
                      ),
                    ],
                  ),
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
    return CustomIconButton(
      globalKey: _buttonKey,
      iconPath: 'assets/png/dot_menu.png',
      onTap: () {
        if (_overlayEntry == null) {
          _showPopup();
        } else {
          _hidePopup();
        }
      },
    );
  }
}
