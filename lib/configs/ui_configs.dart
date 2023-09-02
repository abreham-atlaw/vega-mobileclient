import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ColorsConfigs {
  static const Color primary = Color.fromARGB(255, 0, 98, 189);
  static const Color primaryDark = Color.fromARGB(255, 0, 90, 124);
  static const Color secondary = Color.fromARGB(255, 244, 181, 5);
  static const Color tertiary = Color.fromARGB(255, 0, 88, 209);
  static const Color light = Color.fromARGB(255, 255, 255, 255);
  static const Color grey = Color.fromARGB(255, 198, 198, 198);
  static const Color danger = Color.fromARGB(255, 227, 0, 0);
  static const Color warning = Color.fromARGB(255, 249, 119, 0);
  static const Color success = Color.fromARGB(255, 0, 188, 98);
  static const Color info = Color.fromARGB(255, 0, 163, 255);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color dark = Color.fromARGB(255, 0, 0, 0);
  static const Color darkShadow = Color.fromARGB(100, 26, 26, 26);
}

class FontSizeConfigs {
  static const double size0 = 10;
  static const double size1 = size0 * 1.5;
  static const double size2 = size1 * 1.5;
  static const double size2_5 = size2 * 1.25;
  static const double size3 = size2 * 1.5;
  static const double size4 = size3 * 1.5;
}

class SpacingConfigs {
  static const double spacing0 = 5;
  static const double spacing0_5 = spacing0 * 1.25;
  static const double spacing1 = spacing0 * 1.5;
  static const double spacing2 = spacing1 * 1.5;
  static const double spacing2_5 = spacing2 * 1.25;
  static const double spacing3 = spacing2 * 1.5;
  static const double spacing3_5 = spacing3 * 1.15;
  static const double spacing4 = spacing3 * 1.5;
  static const double spacing5 = spacing4 * 1.5;
  static const double spacing6 = spacing5 * 1.5;
  static const double spacing7 = spacing6 * 1.5;
  static const double spacing8 = spacing7 * 1.5;
  static const double spacing9 = spacing8 * 1.5;
  static const double spacing10 = spacing9 * 1.5;
}

class WidgetSizeConfigs {
  static const double size0 = 50;
  static const double size0_5 = size0 * 1.25;
  static const double size1 = size0 * 1.5;
  static const double size2 = size1 * 1.5;
  static const double size3 = size2 * 1.5;
  static const double size4 = size3 * 1.5;
  static const double size4_5 = size4 * 1.25;
  static const double size5 = size4 * 1.5;
  static const double size6 = size5 * 1.5;
  static const double size7 = size6 * 1.5;
  static const double size8 = size7 * 1.5;
  static const double size9 = size8 * 1.5;
  static const double size10 = size9 * 1.5;
}

class LoadingIndicatorsConfigs {
  static const LoadingIndicator indicatorLight = LoadingIndicator(
    indicatorType: Indicator.ballScaleMultiple,
    colors: [ColorsConfigs.light],
  );
  static const LoadingIndicator indicatorDark = LoadingIndicator(
    indicatorType: Indicator.ballScaleMultiple,
    colors: [ColorsConfigs.dark],
  );
}



class SystemUiOverlaysConfigs{

  static const SystemUiOverlayStyle overlayLight = SystemUiOverlayStyle(
    statusBarColor: ColorsConfigs.light,
    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.dark, // For iOS (dark icons)
  );

  static const SystemUiOverlayStyle overlayDark = SystemUiOverlayStyle(
    statusBarColor: ColorsConfigs.dark,
    statusBarIconBrightness: Brightness.light, // For Android (dark icons)
    statusBarBrightness: Brightness.light, // For iOS (dark icons)
  );

}
