import 'package:flutter/material.dart';

// font size
double fontSizeSmall(BuildContext context) => getPixels(context, 20.0);
double fontSizeNormal(BuildContext context) => getPixels(context, 25.0);
double fontSizeMedium(BuildContext context) => getPixels(context, 30.0);
double fontSizeLarge(BuildContext context) => getPixels(context, 35.0);
double fontSizeExtraLarge(BuildContext context) => getPixels(context, 45.0);

// padding
double paddingExtraSmall(BuildContext context) => getPixels(context, 5.0);
double paddingSmall(BuildContext context) => getPixels(context, 10.0);
double paddingDefault(BuildContext context) => getPixels(context, 15.0);
double paddingLarge(BuildContext context) => getPixels(context, 20.0);
double paddingExtraLarge(BuildContext context) => getPixels(context, 25.0);

// font weight
const FontWeight fontWeightNormal = FontWeight.w500;
const FontWeight fontWeightSemiBold = FontWeight.w600;
const FontWeight fontWeightBold = FontWeight.w700;
const FontWeight fontweightblack = FontWeight.w900;

// radius
const double radius = 10.0;

// get pixels with media query
double getPixels(BuildContext context, double pixels) =>
    MediaQuery.of(context).size.width * (pixels / 375);
