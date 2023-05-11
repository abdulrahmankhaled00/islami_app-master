import 'dart:ui';

import 'package:flutter/material.dart';

class Themedata {
  static Color primarylight = Color(0xffB7935F);
  static Color blackcolor = Color(0xff242424);
  static Color whitecolor = Colors.white;
  static Color primarydark = Color(0xff0F1525);
  static Color yellowcolor = Color(0xffFACC1D);
  static ThemeData lighttheme = ThemeData(
    primaryColor: primarylight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: blackcolor)),
    primaryTextTheme: TextTheme(
        headline1: TextStyle(
            color: blackcolor, fontWeight: FontWeight.bold, fontSize: 30),
        headline2: TextStyle(
            color: blackcolor, fontWeight: FontWeight.w400, fontSize: 25),
        headline3: TextStyle(
            color: blackcolor, fontWeight: FontWeight.bold, fontSize: 25)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackcolor,
      unselectedItemColor: whitecolor,
    ),
  );
  static ThemeData darkthem = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: primarydark,
      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(color: whitecolor)),
      primaryTextTheme: TextTheme(
          headline1: TextStyle(
              color: whitecolor, fontWeight: FontWeight.bold, fontSize: 30),
          headline2: TextStyle(
              color: whitecolor, fontWeight: FontWeight.w400, fontSize: 25),
          headline3: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: yellowcolor,
        unselectedItemColor: whitecolor,
      ));
}
