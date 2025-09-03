import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_profile_208415/screens/screens.dart';

void main() {
  runZonedGuarded(
    () {
      runApp(
        ScreenUtilInit(
          designSize: Size(390, 844),
          builder: (context, child) => const MyApp(),
        ),
      );
    },
    (error, stack) {
      print(error);
      print(stack);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: NavigationScreen(child: ProfileScreen()),
    );
  }
}
