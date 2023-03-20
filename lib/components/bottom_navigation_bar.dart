// ignore_for_file: library_private_types_in_public_api

import 'package:cypherkicks/components/images.dart';
import 'package:cypherkicks/screens/collections.dart';
import 'package:cypherkicks/screens/dashboard.dart';
import 'package:cypherkicks/screens/home.dart';
import 'package:cypherkicks/screens/profile.dart';
import 'package:cypherkicks/screens/weight_progress.dart';
import 'package:cypherkicks/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/bottom_nav_bar_utils.dart';

class ReturnNavigationBar extends StatefulWidget {
  const ReturnNavigationBar({super.key});

  @override
  _ReturnNavigationBarState createState() => _ReturnNavigationBarState();
}

class _ReturnNavigationBarState extends State<ReturnNavigationBar> {
  Duration animationDuration = const Duration(milliseconds: 1500);

  int _selectedIndex = 0;
  int previousIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const Dashboard(),
    const WeightProgress(),
    const Collections(),
    const Profile(),
  ];

  _onItemTapped(int index) {
    setState(() {
      previousIndex = _selectedIndex;
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ).copyWith(top: 5, bottom: 15),
          height: Get.height * 0.09,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80), color: kwhiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (() {
                  _onItemTapped(0);
                }),
                child: Image.asset(
                  Images.homeicon,
                  height: Get.width * 0.06,
                  width: Get.width * 0.1,
                  color: BottomNavBarUtils.color(
                      0, _selectedIndex, kprimary, kgreyColor),
                ),
              ),
              InkWell(
                onTap: () {
                  _onItemTapped(1);
                },
                child: Image.asset(
                  Images.sneakers,
                  height: Get.width * 0.06,
                  width: Get.width * 0.1,
                  color: BottomNavBarUtils.color(
                      1, _selectedIndex, kprimary, kgreyColor),
                ),
              ),
              InkWell(
                onTap: () {
                  _onItemTapped(2);
                },
                child: Image.asset(
                  Images.weight,
                  height: Get.width * 0.06,
                  width: Get.width * 0.1,
                  color: BottomNavBarUtils.color(
                      2, _selectedIndex, kprimary, kgreyColor),
                ),
              ),
              InkWell(
                onTap: () {
                  _onItemTapped(3);
                },
                child: Image.asset(
                  Images.box,
                  height: Get.width * 0.06,
                  width: Get.width * 0.1,
                  color: BottomNavBarUtils.color(
                      3, _selectedIndex, kprimary, kgreyColor),
                ),
              ),
              InkWell(
                onTap: () {
                  _onItemTapped(4);
                },
                child: Image.asset(
                  Images.person,
                  height: Get.width * 0.06,
                  width: Get.width * 0.1,
                  color: BottomNavBarUtils.color(
                      4, _selectedIndex, kprimary, kgreyColor),
                ),
              ),
            ],
          )),
    );
  }
}
