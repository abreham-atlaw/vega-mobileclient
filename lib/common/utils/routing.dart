import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class RoutingUtils {
  static void redirect(String path, BuildContext context, {Object? extra}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.go(path, extra: extra);
    });
    WidgetsBinding.instance.scheduleFrame();
  }
}
