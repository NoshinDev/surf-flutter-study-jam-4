import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/constant/custom_colors.dart';
import 'package:surf_practice_magic_ball/ui/theme/text_theme.dart';

ThemeData darkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: textThemeMode(kDarkThemeText),
  );
}
