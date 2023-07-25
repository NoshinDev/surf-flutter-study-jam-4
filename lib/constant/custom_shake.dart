import 'package:flutter/widgets.dart';

import 'package:flutter_shake_animated/flutter_shake_animated.dart';

class CustomSlowShake implements ShakeConstant {
  @override
  List<int> get interval => [2];

  @override
  List<double> get opacity => const [];

  @override
  List<double> get rotate => const [0];

  @override
  List<Offset> get translate => const [
        Offset(0, 0),
        Offset(0, 2),
        Offset(0, 5),
        Offset(0, 7),
        Offset(0, 10),
        Offset(0, 7),
        Offset(0, 5),
        Offset(0, 2),
        Offset(0, 0),
        Offset(0, 0),
        Offset(0, 2),
        Offset(0, 5),
        Offset(0, 7),
        Offset(0, 10),
        Offset(0, 7),
        Offset(0, 5),
        Offset(0, 2),
        Offset(0, 0),
        Offset(0, 0),
        Offset(0, 2),
        Offset(0, 5),
        Offset(0, 7),
        Offset(0, 10),
        Offset(0, 7),
        Offset(0, 5),
        Offset(0, 2),
        Offset(0, 0),
        Offset(0, 0),
        Offset(0, 2),
        Offset(0, 5),
        Offset(0, 7),
        Offset(0, 10),
        Offset(0, 7),
        Offset(0, 5),
        Offset(0, 2),
        Offset(0, 0),
      ];

  @override
  Duration get duration => const Duration(milliseconds: 3000);
}
