import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todolist_app/core/utils/color_manager.dart';
import 'package:todolist_app/core/utils/constant_manager.dart';
import 'package:todolist_app/core/utils/dialog_utils/dialog_utils.dart';
import 'package:todolist_app/core/utils/email_validation.dart';
import 'package:todolist_app/core/utils/route_manager.dart';
import 'package:todolist_app/database_manager/model/user_dm.dart';
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

  GlobalKey<FormState> formKey = GlobalKey();

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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 55.h,
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
                  height: 15.h,
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
                  height: 15.h,
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
                    hintText: 'Enter your email address',
                    controller: emailController,
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'Plz, Enter email address';
                      }
                      if (!isEmailValid(input)) {
                        return 'Email wrong format';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 15.h,
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
                  isSecure: true,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Plz, Enter password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15.h,
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
                  isSecure: true,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Enter the password again';
                    }
                    if (input != passwordController.text) {
                      return "Password doesn't match";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 35.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    signUp();
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.regColor),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account!",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesManager.login);
                      },
                      child: Text(
                        'Sign_in',
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: ColorsManager.white,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    if (formKey.currentState!.validate() == false) return;

    try {
      DialogUtils.showLoading(context, message: 'Wait...');
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text,
               password: passwordController.text);
      addUserToFireStore(credential.user!.uid);//create user
      print(credential.user!.uid);

      if(mounted) {
        DialogUtils.hide(context);
      }

      DialogUtils.showMessage(context, title: 'Registered successfully',
        posActionTitle: 'Ok', posAction: (){
        Navigator.pushReplacementNamed(context, RoutesManager.login);
          }
      );
    } on FirebaseAuthException catch (error) {
      DialogUtils.hide(context);
      late String message;
      if (error.code == ConstantManager.weakPassword) {
        message = 'The password provided is too weak.';
      } else if (error.code == ConstantManager.emailUsed) {
        message = 'The account already exists for that email.';
      }
      DialogUtils.showMessage(context, title: 'Error', body: message);
    } catch (error) {
      DialogUtils.hide(context);
      DialogUtils.showMessage(context,title: 'Error', body: error.toString());
      print(error);
    }
  }

  addUserToFireStore(String uid) async{
   CollectionReference userCollection = FirebaseFirestore.instance.collection(UserDM.collectionName);
   DocumentReference userDocument = userCollection.doc(uid);
   UserDM userDM = UserDM(id: uid, fullName: fullNameController.text, userName: userNameController.text, email: emailController.text);
   await userDocument.set(userDM.toFireStore());

 }
}
