import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/color.dart';

ThemeData themeEnglish = ThemeData(
  useMaterial3: true,
  fontFamily: "Poppins",
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColor.backgroundcolor,
    surfaceTintColor: AppColor.backgroundcolor,
    elevation: 0,
    centerTitle: true,
  ),
  scaffoldBackgroundColor: AppColor.backgroundcolor,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColor.black,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColor.black,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 28,
      color: AppColor.black,
    ),
    bodyLarge: TextStyle(
      height: 2,
      color: AppColor.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    bodySmall: TextStyle(height: 2, color: AppColor.grey, fontSize: 14),
  ),
);
ThemeData themeArabic = ThemeData(
  fontFamily: "Pnu",
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColor.backgroundcolor,
    surfaceTintColor: AppColor.backgroundcolor,
    elevation: 0,
    centerTitle: true,
  ),
  scaffoldBackgroundColor: AppColor.backgroundcolor,
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColor.black,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 28,
      color: AppColor.black,
    ),
    bodyLarge: TextStyle(
      height: 2,
      color: AppColor.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    bodySmall: TextStyle(height: 2, color: AppColor.grey, fontSize: 14),
  ),
);
