import 'package:flutter/material.dart';
import 'package:todolist_app/core/utils/app_textStyle.dart';
import 'package:todolist_app/core/utils/color_manager.dart';

class AppTheme {
  static bool isDarkEnable = true;
  static ThemeData light = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.blue,
    primary: ColorsManager.blue,
      onPrimary: ColorsManager.white,
      background: ColorsManager.bgColor
    ),
    scaffoldBackgroundColor: ColorsManager.bgColor,
    appBarTheme: AppBarTheme(
      color: ColorsManager.blue,
      titleTextStyle: AppLightStyle.appBarTextStyle,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.blue,
        iconSize: 30,
        elevation: 20,
        shape: StadiumBorder(
            side: BorderSide(color: ColorsManager.white, width: 4))),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.white,
      selectedItemColor: ColorsManager.blue,
      unselectedItemColor: ColorsManager.grey,
      selectedIconTheme: IconThemeData(
        size: 36,
      ),
      unselectedIconTheme: IconThemeData(size: 36),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        )
      ),
      elevation: 18,
      backgroundColor: ColorsManager.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        fixedSize: const Size.fromHeight(50),
        padding: const EdgeInsets.symmetric(horizontal: 30,),
        textStyle: AppLightStyle.buttonTextStyle,
    ),),
    hintColor: ColorsManager.blue,
  );

  static ThemeData dark = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.blue,
        primary: ColorsManager.blue,
        onPrimary: ColorsManager.darkBlue,
        background: ColorsManager.darkColor
    ),
    scaffoldBackgroundColor: ColorsManager.darkColor,
    appBarTheme: AppBarTheme(
      color: ColorsManager.blue,
      titleTextStyle: AppLightStyle.appBarTextStyle,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.blue,
        iconSize: 30,
        elevation: 20,
        shape: StadiumBorder(
            side: BorderSide(color: ColorsManager.darkBlue, width: 4))),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.darkBlue,
      selectedItemColor: ColorsManager.blue,
      unselectedItemColor: ColorsManager.lightGrey,
      selectedIconTheme: IconThemeData(
        size: 36,
      ),
      unselectedIconTheme: IconThemeData(size: 36),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          )
      ),
      elevation: 18,
      backgroundColor: ColorsManager.darkColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        fixedSize: const Size.fromHeight(50),
        padding: const EdgeInsets.symmetric(horizontal: 30,),
      ),),
    hintColor: ColorsManager.blue,
  );
}
