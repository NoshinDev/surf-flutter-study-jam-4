import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/ui/screen/home/magic_ball_screen.dart';
import 'package:surf_practice_magic_ball/ui/screen/settings/provider/color_provider.dart';
import 'package:surf_practice_magic_ball/ui/screen/settings/settings_screen.dart';

class ScreenFactory {
  Widget makeHomeScreen() {
    return const MainMagicBallScreen();
  }

  Widget makeSettingsScreen() {
    return const SettingsScreen();
  }
}
