import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:vega/lib/utils/routing.dart';

class Link extends StatelessWidget {
  final String to;
  final Widget? child;
  const Link({required this.to, super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RoutingUtils.redirect(to, context);
      },
      child: child,
    );
  }
}
