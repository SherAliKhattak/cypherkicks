import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/bottom_navigation_bar.dart';
import '../../components/snackbar.dart';
import '../../models/user_model.dart';
import '../controllers/auth_controller.dart';

class FirebaseDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserModel users = UserModel();
  Future sendUsertoFirebase() async {
    AuthController.i.resetIsLoading(value: true);
    UserModel user = UserModel(
        username: AuthController.i.username.text,
        password: AuthController.i.password.text,
        uid: FirebaseAuth.instance.currentUser!.uid,
        email: AuthController.i.email.text);
    await _firestore.collection('users').doc(user.uid).set(user.toFirebase());
    AuthController.i.resetIsLoading(value: false);
    Get.to(() => const ReturnNavigationBar());
  }

  Future<bool> checkifUserExists({String? username, String? password}) async {
    final result = await _firestore
        .collection('users')
        .where('username', isEqualTo: username)
        .where('password', isEqualTo: password)
        .get();
    if (result.docs.isNotEmpty) {
      showSnackbar(Get.context!, 'Login Successful', color: Colors.green);
      Get.offAll(() => const ReturnNavigationBar());
      return true;
    } else {
      showSnackbar(
          Get.context!, 'Please provide a valid username and Password');
      return false;
    }
  }
}
