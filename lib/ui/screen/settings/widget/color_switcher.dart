import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/ui/screen/settings/provider/color_provider.dart';
import 'package:surf_practice_magic_ball/utils/primary_color.dart';

class ColorSwitcher extends StatelessWidget {
  const ColorSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(
      builder: (c, themeProvider, _) => SizedBox(
        height: (450 - (17 * 2) - (10 * 2)) / 3,
        child: GridView.count(
          crossAxisCount: AppColors.primaryColors.length,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          children: List.generate(
            AppColors.primaryColors.length,
            (i) {
              bool isSelectedColor = AppColors.primaryColors[i] ==
                  themeProvider.selectedPrimaryColor;
              return GestureDetector(
                onTap: isSelectedColor
                    ? null
                    : () => themeProvider.setSelectedPrimaryColor(
                        AppColors.primaryColors[i], i),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColors[i],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Theme.of(context).hintColor.withOpacity(0.5))),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isSelectedColor ? 1 : 0,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Theme.of(context).cardColor.withOpacity(0.5),
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
