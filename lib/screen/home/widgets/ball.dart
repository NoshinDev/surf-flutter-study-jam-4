import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/constant/custom_shake.dart';
import 'package:surf_practice_magic_ball/screen/home/provider/magic_ball_provider.dart';
import 'package:surf_practice_magic_ball/domain/entity/magic_ball.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

class Ball extends StatelessWidget {
  const Ball({
    super.key,
    required this.assetUrl,
  });

  final String assetUrl;

  @override
  Widget build(BuildContext context) {
    MagicBall? magicBall = context
        .select<MagicBallProvider, MagicBall?>((value) => value.magicBall);
    Object? error =
        context.select<MagicBallProvider, Object?>((value) => value.error);
    bool? isPressed =
        context.select<MagicBallProvider, bool?>((value) => value.isPressed);
    return InkWell(
      onTap: () {
        context.read<MagicBallProvider>().getPredictionResponse();
      },
      child: ShakeWidget(
        enableWebMouseHover: false,
        autoPlay: isPressed == true,
        duration: const Duration(
          milliseconds: 5000,
        ),
        shakeConstant: ShakeSlowConstant2(),
        child: ShakeWidget(
          enableWebMouseHover: false,
          autoPlay: isPressed == false || isPressed == null,
          duration: Duration(
            milliseconds: 8000 + Random().nextInt(201),
          ),
          shakeConstant: CustomSlowShake(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('${assetUrl}ball.png'),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: error != null ? 1 : 0,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.red.withOpacity(0.7),
                    BlendMode.srcATop,
                  ),
                  child: Image.asset('${assetUrl}background_default.png'),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 700),
                opacity: isPressed == null ? 1 : 0,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Image.asset(
                    '${assetUrl}small_star.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 700),
                opacity: isPressed == null ? 1 : 0,
                child: Padding(
                  padding: const EdgeInsets.all(70.0),
                  child: Image.asset(
                    '${assetUrl}star.png',
                    fit: BoxFit.contain,
                    colorBlendMode: BlendMode.screen,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 700),
                  opacity: magicBall != null ? 1 : 0,
                  child: Text(
                    magicBall?.reading ?? '',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

shake(bool isPressed) {
  return isPressed == true ? ShakeSlowConstant2() : CustomSlowShake();
}
