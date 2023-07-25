import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/ui/screen/settings/widget/color_switcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Настройки',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Цвет шара',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ColorSwitcher(),
          ],
        ),
      ),
    );
  }
}
