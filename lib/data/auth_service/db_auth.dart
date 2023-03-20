// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';
import 'package:cypherkicks/components/bottom_navigation_bar.dart';
import 'package:cypherkicks/components/snackbar.dart';
import 'package:cypherkicks/data/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../models/user_model.dart';

class AuthService {
  final FirebaseAuth? auth = FirebaseAuth.instance;
  UserModel users = UserModel();

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? user;

  Future googleLogin() async {
    try {
      final googleuser = await googleSignIn.signIn();

      user = googleuser;
      final googleAuth = await googleuser!.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        Get.to(() => const ReturnNavigationBar());
      }
    } catch (e) {
      showSnackbar(Get.context!, e.toString());
    }
  }

  Future<void> signupwithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await auth!
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showSnackbar(Get.context!, e.toString());
    }
  }

  Future<void> signInwithEmailandPass(
      {required String email, required String password}) async {
    try {
      log(AuthController.i.isloading.toString());
      await auth!.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showSnackbar(Get.context!, e.toString());
    }
  }
}
