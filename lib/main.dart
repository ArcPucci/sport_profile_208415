import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_profile_208415/providers/providers.dart';
import 'package:sport_profile_208415/screens/screens.dart';
import 'package:sport_profile_208415/services/services.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final sqlService = SqlService();
      await sqlService.init();

      final preferences = await SharedPreferences.getInstance();
      final configService = ConfigService(preferences);

      runApp(
        ScreenUtilInit(
          designSize: Size(390, 844),
          builder: (context, child) =>
              MyApp(sqlService: sqlService, configService: configService),
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
  const MyApp({
    super.key,
    required this.sqlService,
    required this.configService,
  });

  final SqlService sqlService;
  final ConfigService configService;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter router;

  @override
  void initState() {
    super.initState();
    router = GoRouter(
      initialLocation: '/',
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
                  path: 'achievements',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: AchievementsScreen(),
                      ),
                  routes: [
                    GoRoute(
                      path: 'create',
                      pageBuilder: (context, state) =>
                          buildPageWithDefaultTransition(
                            context: context,
                            state: state,
                            child: AchievementScreen(),
                          ),
                    ),
                  ],
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
    return MultiProvider(
      providers: [
        Provider.value(value: widget.configService),
        Provider(
          create: (context) => ProfilesService(widget.sqlService.database),
        ),
        Provider(
          create: (context) => AchievementsService(widget.sqlService.database),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfilesProvider(
            Provider.of(context, listen: false),
            widget.configService,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => AchievementsProvider(
            Provider.of(context, listen: false),
            Provider.of(context, listen: false),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: router,
      ),
    );
  }
}
