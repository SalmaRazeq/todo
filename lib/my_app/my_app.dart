import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todolist_app/confing/theme/app_theme.dart';
import 'package:todolist_app/core/utils/route_manager.dart';
import 'package:todolist_app/presentation/auth/log_in/log-in.dart';
import 'package:todolist_app/presentation/auth/register/register.dart';
import 'package:todolist_app/presentation/home/home_screen.dart';
import 'package:todolist_app/presentation/splash_screen/splash.dart';
import 'package:todolist_app/presentation/update/update_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          RoutesManager.home: (_) => HomeScreen(),
          RoutesManager.splash : (context) => SplashScreen(),
          RoutesManager.update : (context) => UpdateScreen(),
          RoutesManager.register : (context) => Register(),
          RoutesManager.login : (context) => Login(),


        },
        initialRoute: RoutesManager.login,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [
          Locale('en'), // English
          Locale('ar'),
        ],
        locale: Locale('en'),
      ),
    );
  }
}
