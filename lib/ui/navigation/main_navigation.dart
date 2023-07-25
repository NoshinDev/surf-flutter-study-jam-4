import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/domain/factories/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loaderWidget = '/';
  static const home = '/home';
  static const settings = '/settings';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.settings: (_) =>
        _screenFactory.makeSettingsScreen(),
    MainNavigationRouteNames.home: (_) => _screenFactory.makeHomeScreen(),
  };
}
