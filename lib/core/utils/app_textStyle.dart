import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todolist_app/confing/theme/app_theme.dart';
import 'package:todolist_app/core/utils/color_manager.dart';


class AppLightStyle{
  static TextStyle? appBarTextStyle = TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w700,color: ColorsManager.white,);
  static TextStyle? taskBottomTextStyle = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400, color: ColorsManager.darkGrey);
  static TextStyle? hintTextStyle = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: ColorsManager.hint);
  static TextStyle? dateStyle = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, color: ColorsManager.hint);
  static TextStyle? headerTaskBottom =  TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700, color: ColorsManager.darkGrey);
  static TextStyle? buttonTextStyle = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: ColorsManager.white);
  static TextStyle? taskTitle = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, color: ColorsManager.blue);
  static TextStyle? taskDescription = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: ColorsManager.darkGrey);
  static TextStyle? headerSettings = TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700, color: ColorsManager.darkGrey);
  static TextStyle? mode = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: ColorsManager.blue);
  static TextStyle? inactiveDayStyle = TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700, color: ColorsManager.darkGrey);
  static TextStyle? todayDayStyle = TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700, color: ColorsManager.blue);
  static TextStyle? updateHeader = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: ColorsManager.darkGrey);
  static TextStyle? updateTextStyle = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, color: ColorsManager.darkGrey);

  static TextStyle? controllerTextStyle = TextStyle(fontSize: 18.sp,color: Colors.black);




}

class AppDarkStyle{
  static TextStyle? appBarTextStyle = TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w700,color: ColorsManager.darkColor,);
  static TextStyle? taskBottomTextStyle = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400, color: ColorsManager.lightGrey);
  static TextStyle? hintTextStyle = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: ColorsManager.lightGrey);
  static TextStyle? dateStyle = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, color: ColorsManager.lightGrey);
  static TextStyle? headerTaskBottom =  TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700, color: ColorsManager.white);
  static TextStyle? buttonTextStyle = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: ColorsManager.white);
  static TextStyle? taskTitle = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, color: ColorsManager.blue);
  static TextStyle? taskDescription = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: ColorsManager.darkGrey);
  static TextStyle? headerSettings = TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700, color: ColorsManager.white);
  static TextStyle? mode = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: ColorsManager.blue);
  static TextStyle? inactiveDayStyle = TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700, color: ColorsManager.white);
  static TextStyle? todayDayStyle = TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700, color: ColorsManager.blue);
  static TextStyle? updateHeader = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: ColorsManager.white);
  static TextStyle? updateTextStyle = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, color: ColorsManager.white);
  static TextStyle? controllerTextStyle = TextStyle(fontSize: 18.sp,color: Colors.white);

}




