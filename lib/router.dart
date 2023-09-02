import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vega/apps/core/presentation/screens/generate_screen.dart';
import 'package:vega/apps/core/presentation/screens/home_screen.dart';
import 'package:vega/apps/core/presentation/screens/player_screen.dart';


class VegaAppRouter extends GoRouter {
  VegaAppRouter()
      : super(routes: [
          GoRoute(path:"/", builder: (context, state) => const HomeScreen()),
          GoRoute(path: "/core/generate", builder: (context, state) => GenerateScreen()),
          GoRoute(path: "/core/play", builder: (context, state) => PlayerScreen(songId: state.extra as String?)),
          // GoRoute(path: "/", builder: (context, state) => PlayerScreen(songId: "4972f75d-0551-4150-a489-9a7767255e7e"))
        ]);

}
