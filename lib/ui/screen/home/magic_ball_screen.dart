import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_practice_magic_ball/constant/custom_colors.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'package:surf_practice_magic_ball/ui/navigation/main_navigation.dart';
import 'package:surf_practice_magic_ball/utils/guide_text.dart';
import 'provider/magic_ball_provider.dart';
import 'widgets/ball.dart';
import 'widgets/ball_shadow.dart';

class MainMagicBallScreen extends StatelessWidget {
  const MainMagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQueryData.fromView(View.of(context)).size.height;
    var width = MediaQueryData.fromView(View.of(context)).size.width;
    var devicePixelRatio =
        MediaQueryData.fromView(View.of(context)).devicePixelRatio;
    //Блокируем изменения ориентации на телефонах
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
        return const MagicBallScreen();
      },
    );
  }
}

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({super.key});

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  late ShakeDetector detector;

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        context.read<MagicBallProvider>().getPredictionResponse();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    detector.stopListening();
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final String mode = brightness == Brightness.dark ? 'dark' : 'light';
    final String assetUrl = 'assets/images/${mode}_ball/';
    var width = MediaQueryData.fromView(View.of(context)).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(
              MainNavigationRouteNames.settings,
            ),
            child: const Icon(Icons.settings),
          ),
        ],
      ),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            const Expanded(child: SizedBox()),
            //Сам шар
            Expanded(
              flex: 3,
              child: Ball(assetUrl: assetUrl),
            ),
            //Тень шара
            Expanded(
              flex: 2,
              child: BallShadow(assetUrl: assetUrl),
            ),
            //Инструкция
            Expanded(
              child: Text(
                guideText(width),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
