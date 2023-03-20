import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kblackColor = Color(0xFF000000);
const kprimary = Color(0xFF5D53C4);
const ksecondary = Color(0xFFB647AD);
const kwhiteColor = Color(0xFFFFFFFF);
const kgreyColor = Colors.grey;
const kgolden = Color(0xFFF3A3B0);
const kcontainer = Color(0xFFA88CD3);
const kselectedText = Color(0xFFB24448);
const ksecondaryScaffold = Color(0xFFECECED);
const kContainer = Color(0xFF42407A);

ThemeData lightTheme = ThemeData(
  fontFamily: GoogleFonts.robotoSlab().fontFamily,
  scaffoldBackgroundColor: kprimary,
  useMaterial3: true,
  dividerColor: kprimary,
  secondaryHeaderColor: ksecondary,
  disabledColor: const Color(0xFFBABFC4),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: const Color(0xFFF6F6F6),
  textTheme: TextTheme(
    displaySmall: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontFamily: GoogleFonts.abrilFatface().fontFamily,
        color: kblackColor),
    displayMedium: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontFamily: GoogleFonts.abrilFatface().fontFamily,
        color: kblackColor),
    displayLarge: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontFamily: GoogleFonts.abrilFatface().fontFamily,
        color: kblackColor),
    bodyLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    bodySmall: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    titleSpacing: 20,
    iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
    titleTextStyle: TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 20,
    ),
  ),
);
