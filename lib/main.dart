import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  bool opaque = true,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration.zero,
    opaque: opaque,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter router;

  @override
  void initState() {
    super.initState();
    router = GoRouter(
      initialLocation: '/skillsEdit',
      routes: [
        ShellRoute(
          builder: (context, state, child) =>
              NavigationScreen(path: state.fullPath ?? '/', child: child),
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: ProfileScreen(),
              ),
              routes: [
                GoRoute(
                  path: 'edit',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: ProfileEditScreen(),
                      ),
                ),
                GoRoute(
                  path: 'skillsEdit',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: SkillsEditScreen(),
                      ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
    );
  }
}
