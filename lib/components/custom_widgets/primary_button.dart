import 'package:cypherkicks/data/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/themes/themes.dart';

class PrimaryButon extends StatelessWidget {
  final double? width;
  final Widget? icon;
  final double? radius;
  final Color? textColor;
  final String title;
  final Color? backgroundColor;
  final BoxBorder? boxborder;
  final Function()? onPressed;
  final EdgeInsetsGeometry? margin;
  const PrimaryButon(
      {Key? key,
      required this.title,
      this.onPressed,
      this.margin,
      this.backgroundColor = kprimary,
      this.textColor = Colors.white,
      this.boxborder,
      this.radius,
      this.icon,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (contr) {
      return Container(
        padding: margin,
        height: Get.height * 0.06,
        width: width,
        child: ElevatedButton.icon(
            icon: icon ?? const SizedBox(),
            style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(10)),
            onPressed: onPressed,
            label: contr.isloading == false
                ? Text(
                    title,
                    style: TextStyle(color: textColor),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: kprimary,
                    ),
                  )),
      );
    });
  }
}
