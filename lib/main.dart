import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/ui/screen/home/magic_ball_screen.dart';
import 'package:surf_practice_magic_ball/ui/theme/dark_theme.dart';
import 'package:surf_practice_magic_ball/ui/theme/light_theme.dart';
import 'package:surf_practice_magic_ball/ui/screen/settings/provider/color_provider.dart';
import 'ui/navigation/main_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
      create: (_) => ColorProvider(), child: const MyApp()));
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
        home: const MainMagicBallScreen(),
        routes: MainNavigation().routes,
        initialRoute: MainNavigationRouteNames.home);
  }
}
