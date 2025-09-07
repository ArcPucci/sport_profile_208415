import 'package:flutter/material.dart';

class CustomPopupMenuItem<T> {
  final T value;
  final String label;

  CustomPopupMenuItem({required this.value, required this.label});
}

class FancyDropdown<T> extends StatefulWidget {
  final T value;
  final List<CustomPopupMenuItem<T>> items;
  final ValueChanged<T> onChanged;

  final Widget Function(BuildContext context, T value, bool isOpen)
  childBuilder;

  final Widget Function(
    BuildContext context,
    CustomPopupMenuItem<T> item,
    bool isSelected,
  )?
  itemBuilder;
  final double maxMenuHeight;

  const FancyDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.childBuilder,
    this.itemBuilder,
    this.maxMenuHeight = 250,
  });

  @override
  State<FancyDropdown<T>> createState() => _FancyDropdownState<T>();
}

class _FancyDropdownState<T> extends State<FancyDropdown<T>>
    with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 220),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _toggleMenu() {
    if (_isOpen) {
      _hideMenu();
    } else {
      _showMenu();
    }
    setState(() {});
  }

  void _showMenu() {
    final overlay = Overlay.of(context);
    final box = context.findRenderObject() as RenderBox;
    final position = box.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          ModalBarrier(
            color: Colors.transparent,
            dismissible: true,
            onDismiss: _hideMenu,
          ),
          Positioned(
            left: position.dx,
            top: position.dy + box.size.height + 6,
            width: box.size.width,
            child: Material(
              color: Colors.transparent,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: widget.maxMenuHeight,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: widget.items.map((item) {
                          final isSelected = item.value == widget.value;
                          return InkWell(
                            onTap: () {
                              widget.onChanged(item.value);
                              _hideMenu();
                            },
                            child: widget.itemBuilder != null
                                ? widget.itemBuilder!(context, item, isSelected)
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    child: Text(
                                      item.label,
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.green
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    overlay.insert(_overlayEntry!);
    _controller.forward(from: 0);
    setState(() => _isOpen = true);
  }

  void _hideMenu() async {
    await _controller.reverse();
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() => _isOpen = false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleMenu,
      child: widget.childBuilder(context, widget.value, _isOpen),
    );
  }
}
