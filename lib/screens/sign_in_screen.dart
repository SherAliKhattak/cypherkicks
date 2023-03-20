// ignore_for_file: body_might_complete_normally_nullable

import 'package:cypherkicks/components/custom_widgets/custom_text_field.dart';
import 'package:cypherkicks/components/custom_widgets/primary_button.dart';
import 'package:cypherkicks/data/auth_service/db_auth.dart';
import 'package:cypherkicks/data/controllers/auth_controller.dart';
import 'package:cypherkicks/screens/sign_up_screen.dart';
import 'package:cypherkicks/utils/constants.dart';
import 'package:cypherkicks/utils/styles.dart';
import 'package:cypherkicks/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/images.dart';
import '../data/db_service/firebase_db.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ksecondary, kprimary])),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          minimum: EdgeInsets.all(paddingLarge(context)),
          child: GetBuilder<AuthController>(builder: (auth) {
            return Form(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      appname,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: kwhiteColor,
                          fontSize: fontSizeMedium(context)),
                    ),
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                    CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty || !value.isEmail) {
                            return 'please enter a valid email';
                          }
                        },
                        prefixIcon: const Icon(
                          Icons.person_pin_circle_outlined,
                          color: kgreyColor,
                        ),
                        prefixIconColor: kgreyColor,
                        loginController: username,
                        hintText: 'Username',
                        isObscure: false),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    CustomTextField(
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: kgreyColor,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your password';
                          }
                        },
                        prefixIconColor: kgreyColor,
                        height: Get.height * 0.07,
                        loginController: password,
                        hintText: 'Password',
                        contentPadding: EdgeInsets.all(paddingDefault(context)),
                        isObscure: true),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    PrimaryButon(
                      width: Get.width * 0.6,
                      radius: 15,
                      textColor: kblackColor,
                      title: 'Sign in',
                      onPressed: () {
                        FirebaseDB().checkifUserExists(
                            username: username.text, password: password.text);
                      },
                      backgroundColor: kwhiteColor,
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    PrimaryButon(
                      icon: Image.asset(Images.apple),
                      width: Get.width * 0.6,
                      radius: 15,
                      textColor: kblackColor,
                      title: 'Sign in with Apple',
                      onPressed: () {},
                      backgroundColor: kwhiteColor,
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    PrimaryButon(
                      width: Get.width * 0.6,
                      icon: Image.asset(Images.google),
                      radius: 15,
                      textColor: kblackColor,
                      title: 'Sign in with Google',
                      onPressed: () {
                        AuthService().googleLogin();
                      },
                      backgroundColor: kwhiteColor,
                    ),
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                    TextButton(
                        onPressed: (() {
                          Get.to(() => const Signup());
                        }),
                        child: Text(
                          'Create Account',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: kwhiteColor),
                        ))
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
