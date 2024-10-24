import 'package:flutter/material.dart';
import 'package:todolist_app/confing/theme/app_theme.dart';
import 'package:todolist_app/core/utils/route_manager.dart';
import 'package:todolist_app/presentation/home/home_screen.dart';
import 'package:todolist_app/presentation/splash_screen/splash.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RoutesManager.homeRoute: (_) => HomeScreen(),
        RoutesManager.splashRoute : (context) => SplashScreen(),
      },
      initialRoute: RoutesManager.splashRoute,
      theme: AppTheme.light,
      themeMode: ThemeMode.light,

    );
  }
}
