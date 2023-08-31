import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vega/apps/core/presentation/screens/generate_screen.dart';


class VegaAppRouter extends GoRouter {
  VegaAppRouter()
      : super(routes: [
          GoRoute(path: "/", builder: (context, state) => GenerateScreen()),
        ]);

}
