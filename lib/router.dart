import 'package:go_router/go_router.dart';
import 'package:vega/features/auth/presentation/screens/login_screen.dart';
import 'package:vega/features/auth/presentation/screens/signup_screen.dart';
import 'package:vega/features/core/presentation/screens/base_screen.dart';
import 'package:vega/features/core/presentation/screens/library_screen.dart';
import 'package:vega/features/core/presentation/screens/playlist_screen.dart';
import 'package:vega/features/core/presentation/screens/splash_screen.dart';
import 'package:vega/features/generation/data/models/generate_query.dart';
import 'package:vega/features/generation/presentation/screens/generate_screen.dart';
import 'package:vega/features/core/presentation/screens/home_screen.dart';
import 'package:vega/features/generation/presentation/screens/generating_screen.dart';
import 'package:vega/features/player/application/states/play_song_state.dart';
import 'package:vega/features/player/presentation/screens/play_song_screen.dart';
import 'package:vega/features/player/presentation/screens/player_screen.dart';


class VegaAppRouter extends GoRouter {
  VegaAppRouter()
      : super(routes: [

          GoRoute(path: "/", builder: (context, state) => const SplashScreen()),

          ShellRoute(
              builder: (context, state, child) => BaseScreen(child),
              routes: [
                      GoRoute(path: "/core/home", builder: (context, state) => const HomeScreen()),
                      GoRoute(path: "/core/playlist", builder: (context, state) => PlaylistScreen(state.extra as String)),
                      GoRoute(path: "/core/library", builder: (context, state) => const LibraryScreen()),
              ]
          ),

          GoRoute(path: "/generation/generate", builder: (context, state) => GenerateScreen()),
          GoRoute(path: "/generation/generate-query", builder: (context, state) => GeneratingScreen(state.extra as GenerateQuery)),

          GoRoute(path: "/player/play", builder: (context, state) => PlaySongScreen(state.extra as String)),
          GoRoute(path: "/player/player", builder: (context, state) => const PlayerScreen()),

          GoRoute(path: "/auth/login", builder: (context, state) => const LoginScreen()),
          GoRoute(path: "/auth/signup", builder: (context, state) => const SignupScreen()),
        ]);

}
