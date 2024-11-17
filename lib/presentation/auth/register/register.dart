
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todolist_app/core/utils/color_manager.dart';
import 'package:todolist_app/presentation/auth/register/widget/field_design.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController fullNameController;

  late TextEditingController userNameController;

  late TextEditingController emailController;

  late TextEditingController passwordController;

  late TextEditingController rePasswordController;

  @override
  void initState() {
    fullNameController = TextEditingController();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fullNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.regColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.regColor,
        centerTitle: true,
        title: Text(
          'TO DO APP',
          style: TextStyle(fontSize: 40.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 60.h,
              ),
              Text(
                'Full name',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.white),
              ),
              SizedBox(
                height: 10.h,
              ),
              RegisterDesign(
                hintText: 'Enter your full name',
                controller: fullNameController,
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Plz, Enter full name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'User_name',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.white),
              ),
              SizedBox(
                height: 10.h,
              ),
              RegisterDesign(
                hintText: 'Enter your user_name',
                controller: userNameController,
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Plz, Enter user_name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'E-mail address',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.white),
              ),
              SizedBox(
                height: 10.h,
              ),
              RegisterDesign(
                hintText: 'Enter your e_mail ',
                controller: emailController,
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Plz, Enter email address';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Password',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.white),
              ),
              SizedBox(
                height: 10.h,
              ),
              RegisterDesign(
                hintText: 'Enter your password',
                controller: passwordController,
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Plz, Enter password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Confirm password',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.white),
              ),
              SizedBox(
                height: 10.h,
              ),
              RegisterDesign(
                hintText: 'Enter your password',
                controller: rePasswordController,
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Enter the password again';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 35.h,
              ),

              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: 20.sp, fontWeight: FontWeight.w500,color: ColorsManager.regColor),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r))
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
