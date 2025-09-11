import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key, required this.path, required this.child});

  final String path;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final hasNavBar =
        !path.contains('edit') &&
        !path.contains('skillsEdit') &&
        !path.contains('create') &&
        !path.contains('info');
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/png/background.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(child: child),
            if (hasNavBar)
              Positioned(
                bottom: 0,
                child: SafeArea(child: CustomNavBar(path: path)),
              ),
          ],
        ),
      ),
    );
  }
}
