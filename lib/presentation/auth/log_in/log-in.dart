import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todolist_app/core/utils/color_manager.dart';
import 'package:todolist_app/core/utils/constant_manager.dart';
import 'package:todolist_app/core/utils/dialog_utils/dialog_utils.dart';
import 'package:todolist_app/core/utils/email_validation.dart';
import 'package:todolist_app/core/utils/route_manager.dart';
import 'package:todolist_app/database_manager/model/user_dm.dart';
import 'package:todolist_app/presentation/auth/register/widget/field_design.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;

  late TextEditingController passwordController;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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
          style: TextStyle(
            fontSize: 40.sp,
          ),
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
                  height: 60.h,
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
                    hintText: 'Enter your email address ',
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
                  isSecure: true,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Plz, Enter password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 35.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    signIn();
                  },
                  child: Text(
                    'Sign in',
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
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account?",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesManager.register);
                      },
                      child: Text(
                        'Create account',
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

  void signIn() async {
    if (formKey.currentState!.validate() == false) return;

    try {
      DialogUtils.showLoading(context, message: 'Wait...');
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      UserDM.currentUser = await readUserFromFireStore(credential.user!.uid);

      if (mounted) {
        DialogUtils.hide(context);
      }

      DialogUtils.showMessage(context,
          title: 'User logged in successfully',
          posActionTitle: 'Ok', posAction: () {
        Navigator.pushReplacementNamed(context, RoutesManager.home,);
      });
    } on FirebaseAuthException catch (error) {
      DialogUtils.hide(context);
      late String message;
      if (error.code == ConstantManager.invalidCredential) {
        message = 'Wrong email or password';
      }
      DialogUtils.showMessage(context, body: message);
    } catch (error) {
      DialogUtils.hide(context);
      DialogUtils.showMessage(context, body: error.toString());
      print(error);
    }
  }

  Future<UserDM> readUserFromFireStore(String uid) async{
    CollectionReference userCollection =
        FirebaseFirestore.instance.collection(UserDM.collectionName);

    DocumentReference userDocument = userCollection.doc(uid);

    DocumentSnapshot userDocSnapShot = await userDocument.get();
    Map<String, dynamic> json =userDocSnapShot.data() as Map<String, dynamic>;
    UserDM userDM = UserDM.fromFireStore(json);
    return userDM;
  }
}
