import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todolist_app/core/utils/color_manager.dart';

typedef Validator = String? Function(String?);

class RegisterDesign extends StatelessWidget {
  RegisterDesign({super.key, required this.hintText, required this.controller, required this.validator});
  String hintText;
  TextEditingController controller;
  Validator validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller, style: TextStyle(fontSize: 18.sp),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 16.sp,color: ColorsManager.hint),
        filled: true,
        fillColor: ColorsManager.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: Colors.red, width: 2.w)
        ),
      ),
    );
  }
}
