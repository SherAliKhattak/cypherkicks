import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

import '../../components/snackbar.dart';

class ProfileController extends GetxController implements GetxService {
  File? file;
  String? imagepath;

  late TextEditingController nickname;
  late TextEditingController address;
  late TextEditingController username;
  late TextEditingController country;

  Future<File?> pickImage(
    BuildContext context,
  ) async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        file = File(result.files.first.path!);
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
    update();
    return file;
  }

  @override
  void onInit() {
    nickname = TextEditingController();
    address = TextEditingController();
    username = TextEditingController();
    country = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nickname.dispose();
    address.dispose();
    username.dispose();
    country.dispose();
    super.onClose();
  }

  static ProfileController get i => Get.put(ProfileController());
}
