import 'package:flutter/material.dart';
import 'package:todolist_app/core/utils/assets_manager.dart';
import 'package:todolist_app/core/utils/route_manager.dart';

class SplashScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
    });

    return Scaffold(
      body : Image.asset(
        AssetsManager.lightSplashScreen,
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
