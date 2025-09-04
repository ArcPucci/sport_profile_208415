import 'package:flutter/material.dart';
import 'package:sport_profile_208415/widgets/custom_drawer.dart';
import 'package:sport_profile_208415/widgets/custom_nav_bar.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key, required this.path, required this.child});

  final String path;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final hasNavBar = !path.contains('edit') && !path.contains('skillsEdit');
    return Scaffold(
      drawer: CustomDrawer(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset("assets/png/background.png", fit: BoxFit.cover),
          ),
          Positioned.fill(child: child),
          if (hasNavBar)
            Positioned(
              bottom: 0,
              child: SafeArea(child: CustomNavBar(path: path)),
            ),
        ],
      ),
    );
  }
}
