import 'package:flutter/widgets.dart';

class PercentageContainer extends LayoutBuilder {
  PercentageContainer({super.key, double? width, double? height, Widget? child})
      : super(builder: (BuildContext context, BoxConstraints constraints) {
          if (width != null) {
            width = width! * constraints.maxWidth;
          }
          if (height != null) {
            height = height! * constraints.maxHeight;
          }
          return SizedBox(width: width, height: height, child: child);
        });
}
