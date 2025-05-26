import 'dart:math';
import 'dart:ui';

import 'package:clean_arch_app/core/theming/colors.dart';

class Utils {
  static final List<Color> _colorList = [
    ColorManager.grayShade100,
    ColorManager.lightBlue,
    ColorManager.lightPink,
    ColorManager.lightGreen,
  ];
  static Color getRandomColor() {
    final random = Random();
    return _colorList[random.nextInt(_colorList.length)];
  }
}
