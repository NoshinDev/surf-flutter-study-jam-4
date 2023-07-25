import 'package:shared_preferences/shared_preferences.dart';

class SettingsPreferences {
  static const PREF_KEY = 'pref_key';
  static const COLOR_KEY = 'color_key';

  setColorTheme(int index) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(COLOR_KEY, index);
  }

  getColorTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(COLOR_KEY) ?? 0;
  }
}
