import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vega/apps/auth/presentation/screens/login_screen.dart';
import 'package:vega/apps/auth/presentation/screens/signup_screen.dart';
import 'package:vega/apps/core/presentation/screens/splash_screen.dart';
import 'package:vega/apps/generation/presentation/screens/generate_screen.dart';
import 'package:vega/apps/core/presentation/screens/home_screen.dart';
import 'package:vega/apps/player/presentation/screens/player_screen.dart';


class VegaAppRouter extends GoRouter {
  VegaAppRouter()
      : super(routes: [
          GoRoute(path: "/", builder: (context, state) => const SplashScreen()),
          GoRoute(path: "/core/home", builder: (context, state) => const HomeScreen()),

          GoRoute(path: "/generation/generate", builder: (context, state) => GenerateScreen()),

          GoRoute(path: "/player/play", builder: (context, state) => PlayerScreen(songId: state.extra as String?)),

          GoRoute(path: "/auth/login", builder: (context, state) => const LoginScreen()),
          GoRoute(path: "/auth/signup", builder: (context, state) => const SignupScreen())
        ]);

}
