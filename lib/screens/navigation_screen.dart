import 'package:flutter/material.dart';
import 'package:sport_profile_208415/widgets/custom_nav_bar.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset("assets/png/background.png", fit: BoxFit.cover),
          ),
          Positioned.fill(child: child),
          Positioned(
            bottom: 0,
            child: SafeArea(child: CustomNavBar(path: '/')),
          ),
        ],
      ),
    );
  }
}
