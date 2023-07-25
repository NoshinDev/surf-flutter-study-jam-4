import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_practice_magic_ball/constant/custom_colors.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'provider/magic_ball_provider.dart';
import 'widgets/ball.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQueryData.fromView(View.of(context)).size.height;
    var width = MediaQueryData.fromView(View.of(context)).size.width;
    var devicePixelRatio =
        MediaQueryData.fromView(View.of(context)).devicePixelRatio;
    if (devicePixelRatio <= 2.5 && (width >= 960 || height >= 960)) {
      SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight
        ],
      );
    } else {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }
    return ChangeNotifierProvider(
      create: (BuildContext context) => MagicBallProvider(),
      builder: (context, child) {
        return const MagicBallShake();
      },
    );
  }
}

class MagicBallShake extends StatefulWidget {
  const MagicBallShake({super.key});

  @override
  State<MagicBallShake> createState() => _MagicBallShakeState();
}

class _MagicBallShakeState extends State<MagicBallShake> {
  ShakeDetector? detector;
  @override
  void initState() {
    super.initState();
     detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        Provider.of<MagicBallProvider>(context, listen: false)
            .getPredictionResponse();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Shake!'),
          ),
        );
        // Do stuff on phone shake
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );

    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    detector?.stopListening();
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final String mode = brightness == Brightness.dark ? 'dark' : 'light';
    final String assetUrl = 'assets/images/${mode}_ball/';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: brightness == Brightness.dark
                  ? kDarkBackground
                  : kLightBackground,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Provider.of<MagicBallProvider>(context, listen: false)
                        .getPredictionResponse();
                  },
                  child: Ball(assetUrl: assetUrl),
                ),
                Stack(
                  children: [
                    Center(child: Image.asset('${assetUrl}shadow_back.png')),
                    Transform.translate(
                        offset: const Offset(0, 10),
                        child: Center(
                            child: Image.asset('${assetUrl}shadow_up.png'))),
                  ],
                ),
              ],
            ),
            // SizedBox(
            //   height: 60,
            // ),
            Text(
              'Нажмите на шар \nили потрясите телефон',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
      ),
    );
  }
}
