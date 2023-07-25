import 'package:flutter/foundation.dart' show kIsWeb;

String guideText(double width) {
  if (width < 700) {
    return 'Нажмите на шар \nили потрясите телефон';
  } else if (kIsWeb && width < 1024) {
    return 'Нажмите на шар \nили потрясите планшет';
  } else {
    return 'Нажмите на шар ';
  }
}
