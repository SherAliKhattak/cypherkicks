import 'package:cypherkicks/utils/styles.dart';
import 'package:cypherkicks/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final Color? textColor;
  final String? Function(String?)? validator;
  final Color? primary;
  final Color? secondary;
  final double? height;
  final double? width;
  final String hintText;
  final bool isObscure;
  final Icon? prefixIcon;
  final IconData? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController loginController;
  final EdgeInsetsGeometry? margin;
  final Color? prefixIconColor;
  final Color? hintColor;
  final Function()? onSuffixIconPressed;
  const CustomTextField({
    Key? key,
    required this.loginController,
    required this.hintText,
    required this.isObscure,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.margin,
    this.prefixIconColor,
    this.onSuffixIconPressed,
    this.height,
    this.width,
    this.primary,
    this.secondary,
    this.hintColor,
    this.validator,
    this.textColor = kwhiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width * 0.65,
      color: Colors.transparent,
      child: TextFormField(
        obscureText: isObscure,
        validator: validator,
        style: TextStyle(color: textColor, fontWeight: fontWeightNormal),
        controller: loginController,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                suffixIcon,
                color: kgreyColor,
              ),
              onPressed: onSuffixIconPressed,
              color: kwhiteColor,
            ),
            hintStyle: TextStyle(
              color: hintColor ?? kwhiteColor,
            ),
            iconColor: Theme.of(context).primaryColor,
            enabledBorder:
                border(context, primary: primary, secondary: secondary),
            focusedBorder: border(context, focused: true),
            border: border(context),
            hintText: hintText,
            prefixIcon: prefixIcon),
      ),
    );
  }

  InputBorder border(BuildContext context,
          {bool focused = false,
          Color? primary = kwhiteColor,
          Color? secondary = kwhiteColor}) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: focused ? primary ?? kwhiteColor : secondary ?? kwhiteColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(30),
      );
}
