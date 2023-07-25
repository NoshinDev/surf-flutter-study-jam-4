import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/domain/data/setting_preference.dart';
import 'package:surf_practice_magic_ball/utils/primary_color.dart';

class ColorProvider with ChangeNotifier {
  late Color selectedPrimaryColor;
  late SettingsPreferences _preferences;

  ColorProvider() {
    selectedPrimaryColor = AppColors.primaryColors[0];

    _preferences = SettingsPreferences();
    getSelectedPrimaryColor();
  }

  setSelectedPrimaryColor(Color color, int index) {
    selectedPrimaryColor = color;
    _preferences.setColorTheme(index);
    notifyListeners();
  }

  getSelectedPrimaryColor() async {
    int index = await _preferences.getColorTheme();
    selectedPrimaryColor = AppColors.primaryColors[index];
    notifyListeners();
  }
}
