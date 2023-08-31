import 'package:flutter/widgets.dart';
import 'package:vega/configs/ui_configs.dart';

class Heading extends Text {
  Heading(super.data, double size, {super.key, super.textAlign, Color color = ColorsConfigs.white})
      : super(
            style: TextStyle(
                fontSize: size, fontWeight: FontWeight.bold, color: color));
}

class Heading1 extends Heading {
  Heading1(String data, {super.key, super.textAlign, super.color})
      : super(data, 40);
}

class Heading2 extends Heading {
  Heading2(String data, {super.key, super.textAlign, super.color})
      : super(data, 30);
}

class Heading3 extends Heading {
  Heading3(String data, {super.key, super.textAlign, super.color})
      : super(data, 23);
}

// class Heading1 extends Heading {
//   Heading1(String data, {super.key}) : super(data, 10);
// }


// class Heading1 extends Heading {
//   Heading1(String data, {super.key}) : super(data, 10);
// }
