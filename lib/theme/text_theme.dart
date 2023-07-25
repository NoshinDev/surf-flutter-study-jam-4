import 'package:flutter/material.dart';

TextTheme textThemeMode(final Color kThemeTextColor) {
  return TextTheme(
    displayLarge: TextStyle(
      color: kThemeTextColor,
      fontSize: 40,
      height: 0,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      color: kThemeTextColor,
      fontSize: 36,
      height: 0,
      fontWeight: FontWeight.w500,
    ),
    displaySmall: TextStyle(
      color: kThemeTextColor,
      fontSize: 34,
      height: 0,
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: TextStyle(
      color: kThemeTextColor,
      fontSize: 32,
      height: 0,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      color: kThemeTextColor,
      fontSize: 25,
      height: 0,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      color: kThemeTextColor,
      fontSize: 22,
      height: 0,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: kThemeTextColor,
      fontSize: 24,
      height: 0,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      color: kThemeTextColor,
      fontSize: 20,
      height: 0,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      color: kThemeTextColor,
      fontSize: 16,
      height: 0,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      color: kThemeTextColor,
      fontSize: 16,
      height: 0,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      color: kThemeTextColor,
      fontSize: 14,
      height: 0,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    ),
  );
}