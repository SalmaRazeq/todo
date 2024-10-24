import 'package:flutter/material.dart';
import 'package:todolist_app/core/utils/app_textStyle.dart';
import 'package:todolist_app/core/utils/color_manager.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.bgColor,
    appBarTheme: AppBarTheme(
      color: ColorsManager.blueColor,
      titleTextStyle: ApplightStyle.appBarTextStyle,
      toolbarHeight: 157,
    ),
  );
}
