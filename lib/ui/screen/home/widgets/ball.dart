// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/ui/screen/settings/provider/color_provider.dart';
import 'package:themed/themed.dart';

import 'package:surf_practice_magic_ball/constant/custom_shake.dart';
import 'package:surf_practice_magic_ball/domain/entity/magic_ball.dart';
import 'package:surf_practice_magic_ball/ui/screen/home/provider/magic_ball_provider.dart';

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
              Consumer<ColorProvider>(
                builder: (context, ColorProvider colorProvider, _) {
                  return ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      colorProvider.selectedPrimaryColor == Colors.transparent
                          ? Colors.transparent
                          : colorProvider.selectedPrimaryColor.withOpacity(0.7),
                      BlendMode.srcATop,
                    ),
                    child: Image.asset('${assetUrl}background_default.png'),
                  );
                },
              ),
              isPressed == true
                  ? LoadingBall(
                      assetUrl: assetUrl,
                    )
                  : const SizedBox.shrink(),
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

class LoadingBall extends StatefulWidget {
  const LoadingBall({
    Key? key,
    required this.assetUrl,
  }) : super(key: key);
  final String assetUrl;
  @override
  State<LoadingBall> createState() => _LoadingBallState();
}

class _LoadingBallState extends State<LoadingBall>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1400));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 0.5).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeColors(
        brightness: _animation.value,
        child: Image.asset('${widget.assetUrl}background_default.png'));
  }
}
