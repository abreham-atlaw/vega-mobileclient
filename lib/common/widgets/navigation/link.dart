import 'package:flutter/widgets.dart';
import 'package:vega/common/utils/routing.dart';

class Link extends StatelessWidget {
  final String to;
  final dynamic extra;
  final Widget? child;
  const Link({required this.to, this.extra, super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RoutingUtils.redirect(to, context, extra: extra);
      },
      child: child,
    );
  }
}
