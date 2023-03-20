import 'package:cypherkicks/components/custom_widgets/custom_text_field.dart';
import 'package:cypherkicks/components/custom_widgets/primary_button.dart';
import 'package:cypherkicks/data/local_db/local_db.dart';
import 'package:cypherkicks/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/controllers/profile_controller.dart';
import '../utils/styles.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ksecondaryScaffold,
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.all(paddingExtraLarge(context)),
          child: Center(
            child: GetBuilder<ProfileController>(builder: (contr) {
              return Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Profile',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                color: const Color(0xFF6A6A6A),
                                fontWeight: fontWeightBold),
                      )),
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  GestureDetector(
                    onTap: () {
                      contr.pickImage(context);
                    },
                    child: contr.file != null
                        ? Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    image: FileImage(contr.file!),
                                    fit: BoxFit.cover)),
                          )
                        : const CircleAvatar(
                            radius: 50,
                            backgroundColor: kprimary,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 50,
                              color: kwhiteColor,
                            ),
                          ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  CustomTextField(
                      width: Get.width,
                      textColor: kblackColor,
                      hintColor: kblackColor,
                      primary: kblackColor,
                      secondary: kblackColor,
                      height: Get.height * 0.07,
                      prefixIconColor: kgreyColor,
                      loginController: ProfileController.i.nickname,
                      hintText: 'Nickname',
                      contentPadding: EdgeInsets.all(paddingDefault(context)),
                      isObscure: false),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  CustomTextField(
                      width: Get.width,
                      textColor: kblackColor,
                      hintColor: kblackColor,
                      primary: kblackColor,
                      secondary: kblackColor,
                      height: Get.height * 0.07,
                      prefixIconColor: kgreyColor,
                      loginController: ProfileController.i.address,
                      hintText: 'ADA Address',
                      contentPadding: EdgeInsets.all(paddingDefault(context)),
                      isObscure: false),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  CustomTextField(
                      width: Get.width,
                      textColor: kblackColor,
                      hintColor: kblackColor,
                      primary: kblackColor,
                      secondary: kblackColor,
                      height: Get.height * 0.07,
                      prefixIconColor: kgreyColor,
                      loginController: ProfileController.i.username,
                      hintText: 'Discord Username',
                      contentPadding: EdgeInsets.all(paddingDefault(context)),
                      isObscure: false),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  CustomTextField(
                      width: Get.width,
                      textColor: kblackColor,
                      hintColor: kblackColor,
                      primary: kblackColor,
                      secondary: kblackColor,
                      height: Get.height * 0.07,
                      prefixIconColor: kgreyColor,
                      loginController: ProfileController.i.country,
                      hintText: 'Country',
                      contentPadding: EdgeInsets.all(paddingDefault(context)),
                      isObscure: false),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  PrimaryButon(
                    onPressed: () {
                      PreferencesService().saveProfileData();
                    },
                    title: isDataNull(),
                    radius: 20,
                    width: Get.width,
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  String isDataNull() {
    if (ProfileController.i.file != null ||
        ProfileController.i.nickname.text.isNotEmpty ||
        ProfileController.i.address.text.isNotEmpty ||
        ProfileController.i.username.text.isNotEmpty ||
        ProfileController.i.country.text.isNotEmpty) {
      return 'Update';
    } else {
      return 'Save';
    }
  }
}
