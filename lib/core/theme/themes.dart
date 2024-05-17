import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_palete.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: Colors.white,
    onPrimary: grayWhite,
    background: Colors.white,
    onBackground: primaryGray,
    primaryContainer: primaryBlack,
    secondary: darkerGray,
    onSecondary: primaryGray,
    error: Colors.red,
    onError: Colors.white,
    surface: primaryGray,
    onSurface: Colors.black,
    brightness: Brightness.light,
  ),
  //B4,
  fontFamily: "RobotoCondensed",
  scaffoldBackgroundColor: const Color(0xffFFFFFF),
  iconTheme: const IconThemeData(color: Color(0xffFFFFFF), size: 20),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xffF99F25),
  ),
  dialogTheme: const DialogTheme(backgroundColor: Colors.white),

  textTheme: TextTheme(
    displayLarge: TextStyle(
        fontWeight: FontWeight.w700, fontSize: 60.sp, color: primaryBlack),
    bodyLarge: TextStyle(
        fontWeight: FontWeight.w700, fontSize: 60.sp, color: primaryWhite),
    displayMedium: TextStyle(
        fontWeight: FontWeight.normal, fontSize: 50.sp, color: Colors.black),
    bodyMedium: TextStyle(
        fontWeight: FontWeight.w700, fontSize: 40.sp, color: primaryBlack),
    displaySmall: TextStyle(
        fontWeight: FontWeight.w700, fontSize: 20.sp, color: primaryBlack),
  ),
);
ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme(
      primary: primaryBlack,
      onPrimary: secondaryBlack,
      background: primaryBlack,
      onBackground: primaryBlack,
      primaryContainer: secondaryWhite,
      secondary: grayBlack,
      onSecondary: grayBlack,
      error: Colors.red,
      onError: Colors.white,
      surface: primaryBlack,
      onSurface: secondaryBlack,
      brightness: Brightness.light,
    ),
    fontFamily: "RobotoCondensed",
    scaffoldBackgroundColor: primaryBlack,
    iconTheme: const IconThemeData(color: Color(0xffFFFFFF), size: 20),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryBlack,
    ),
    dialogTheme: const DialogTheme(backgroundColor: primaryBlack),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: primaryBlack, elevation: 0),
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 60.sp, color: Colors.white),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 60.sp, color: primaryBlack),
      displayMedium: TextStyle(
          fontWeight: FontWeight.normal, fontSize: 40.sp, color: Colors.grey),
      bodyMedium: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 40.sp, color: Colors.white),
      displaySmall: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 20.sp, color: Colors.white),
    ));
