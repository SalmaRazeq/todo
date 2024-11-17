import 'package:flutter/material.dart';
import 'package:todolist_app/confing/theme/app_theme.dart';
import 'package:todolist_app/core/utils/assets_manager.dart';
import 'package:todolist_app/core/utils/route_manager.dart';

class SplashScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesManager.home);
    });

    return Scaffold(
      body: Image.asset(
        AppTheme.isDarkEnable
            ? AssetsManager.darkSplashScreen
            : AssetsManager.lightSplashScreen,
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
