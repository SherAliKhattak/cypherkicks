import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPass;
  bool? isloading = false;

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPass = TextEditingController();
    super.onInit();
  }

  resetIsLoading({bool? value}) {
    isloading = value;
    update();
  }

  @override
  void onClose() {
    username.dispose();
    email.dispose();
    password.dispose();
    confirmPass.dispose();
    super.onClose();
  }

  static AuthController get i => Get.put(AuthController());
}
