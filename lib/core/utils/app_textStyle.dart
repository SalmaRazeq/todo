import 'package:flutter/material.dart';
import 'package:todolist_app/core/utils/color_manager.dart';

class ApplightStyle{
  static TextStyle? appBarTextStyle = const TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: ColorsManager.white,);
  static TextStyle? taskBottomTextStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: ColorsManager.darkGrey);
  static TextStyle? hintTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: ColorsManager.hint);
  static TextStyle? dateStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: ColorsManager.hint);
  static TextStyle? headerTaskBottom = const TextStyle(fontSize: 20,fontWeight: FontWeight.w700, color: ColorsManager.darkGrey);
  static TextStyle? buttonTextStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: ColorsManager.white);
  static TextStyle? taskTitle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: ColorsManager.blue);
  static TextStyle? taskDescription = const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: ColorsManager.darkGrey);
  static TextStyle? headerSettings = const TextStyle(fontSize: 20,fontWeight: FontWeight.w700, color: ColorsManager.darkGrey);
  static TextStyle? mode = const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: ColorsManager.blue);

}