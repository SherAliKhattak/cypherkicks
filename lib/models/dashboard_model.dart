import 'package:flutter/material.dart';

import '../components/images.dart';

class DashboardItemsModel {
  String? title;
  Color? color;
  String? image;
  double? value;

  DashboardItemsModel({this.title, this.color, this.image, this.value});
}

List<DashboardItemsModel> items = [
  DashboardItemsModel(
      title: 'Steps',
      color: const Color(0xFF465379),
      image: Images.sneakers,
      value: 4.3),
  DashboardItemsModel(
      title: 'Tokens',
      color: const Color(0xFFD7A305),
      image: Images.star,
      value: 3.2),
  DashboardItemsModel(
      title: 'Distance',
      color: const Color(0xFFBA3E3E),
      image: Images.pin,
      value: 4.3),
  DashboardItemsModel(
      title: 'Calories',
      color: const Color(0xFFFF8100),
      image: Images.fire,
      value: 47)
];
