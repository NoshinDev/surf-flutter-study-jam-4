import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/screen/home/provider/magic_ball_provider.dart';

class BallShadow extends StatelessWidget {
  const BallShadow({
    super.key,
    required this.assetUrl,
  });

  final String assetUrl;

  @override
  Widget build(BuildContext context) {
    Object? error =
        context.select<MagicBallProvider, Object?>((value) => value.error);
    return Stack(
      children: [
        Center(child: Image.asset('${assetUrl}shadow_back.png')),
        Transform.translate(
          offset: const Offset(0, 10),
          child: Center(
            child: Stack(
              children: [
                AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: error == null ? 1 : 0,
                    child: Image.asset('${assetUrl}shadow_up.png')),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: error != null ? 1 : 0,
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.red,
                      BlendMode.srcATop,
                    ),
                    child: Image.asset('${assetUrl}shadow_up.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
