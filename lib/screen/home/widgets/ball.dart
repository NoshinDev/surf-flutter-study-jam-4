

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/screen/home/provider/magic_ball_provider.dart';
import 'package:surf_practice_magic_ball/domain/entity/magic_ball.dart';

class Ball extends StatelessWidget {
  const Ball({
    super.key,
    required this.assetUrl,
  });

  final String assetUrl;

  @override
  Widget build(BuildContext context) {
    MagicBall? magicBall = context.select<MagicBallProvider,MagicBall?>((value) => value.magicBall);
        bool? isPressed = context.select<MagicBallProvider,bool?>((value) => value.isPressed);
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('${assetUrl}ball.png'),
         
        // WidgetMask(
        //   mask: Image.asset('${assetUrl}ball.png'),
        //   child: 
        // Image.asset('${assetUrl}ball.png'),
        //   ColorFiltered(
        //     colorFilter:  ColorFilter.mode(
        //       Colors.red.withOpacity(0.4),
        //       BlendMode.srcATop,
        //     ),
        //     child: Image.asset('${assetUrl}ball.png'),
        //   ),
        // ),
        //           SizedBox(
        //             width: double.infinity,
        //             child: ColorFiltered(
        // colorFilter: const ColorFilter.mode(
        //   Colors.red,
        //   BlendMode.softLight,
        // ),child: Image.asset('${assetUrl}ball.png'),),
        //           ),
        isPressed==null
        ?Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: SizedBox(
              width: double.infinity,
              child: Image.asset('${assetUrl}small_star.png')),
        ):const SizedBox.shrink(),
        isPressed==null?
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: double.infinity,
                child: Image.asset('${assetUrl}star.png',colorBlendMode: BlendMode.screen,)),
          ),
        ):const SizedBox.shrink(),
        magicBall!=null
         ?AnimatedTextKit(
          onNext: (p0, p1) {
            
          },
          repeatForever: false,
          animatedTexts: [
            FadeAnimatedText('THE HARDER!!',textStyle: Theme.of(context).textTheme.headlineMedium,
                duration: const Duration(seconds: 3),fadeOutBegin: 0.9,fadeInEnd: 0.7),]):const SizedBox.shrink(),
      //  magicBall!=null
      //    ?Align(
      //     alignment: Alignment.bottomCenter,
      //     child: Text(magicBall.reading.toString(),style: Theme.of(context).textTheme.headlineMedium,))
      //   :SizedBox.shrink(),
      ],
    );
  }
}
