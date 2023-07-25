import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/screen/home/magic_ball_screen.dart';
import 'package:surf_practice_magic_ball/theme/dark_theme.dart';
import 'package:surf_practice_magic_ball/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

/// App,s main widget.
class MyApp extends StatelessWidget {
  /// Constructor for [MyApp].
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: darkTheme(),
      theme: lightTheme(),
      home: const MagicBallScreen(),
    );
  }
}
