import 'package:flutter/material.dart';

class MyTheme {
  // colors , light theme , appbar, bottomnavBar , text theme

  static Color blackColor = const Color(0xff121312);
  static Color whiteColor = const Color(0xffffffff);
  static Color semiWhiteColor = const Color(0xffC6C6C6);
  static Color greyDarkColor = const Color(0xff282A28);
  static Color greylightColor = const Color(0xff514F4F);
  static Color lightblueColor = const Color(0xff48CFAD);
  static Color redColor = const Color(0xffc7024c);
  static Color yellowColor = const Color(0xffFFBB3B);


  static Color bottomNavigationBackgroundColor = const Color(0xff1A1A1A);

  static ThemeData AppTheme = ThemeData(
      cardColor: const Color(0xff343534),
      primaryColor: yellowColor,
      scaffoldBackgroundColor: blackColor,
      appBarTheme: AppBarTheme(
        backgroundColor: greyDarkColor,
        centerTitle: true,
        elevation: 0,
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
            color: whiteColor,
            fontSize: 17,
            fontWeight: FontWeight.w400,

          ),
          titleMedium: TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,

          ),
          titleSmall: TextStyle(
            color: whiteColor,
            fontSize: 12,
            fontWeight: FontWeight.normal,

          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: greyDarkColor,
          selectedItemColor: yellowColor,
          unselectedItemColor: semiWhiteColor,
          selectedLabelStyle: TextStyle(
            color: whiteColor,
            fontSize: 13,
            fontWeight: FontWeight.normal,

          ),
          selectedIconTheme: const IconThemeData(
            size: 24,
          ),
          unselectedIconTheme: const IconThemeData(
            size: 22,
          )));
}