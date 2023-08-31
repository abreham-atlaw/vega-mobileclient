


import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';
import 'package:vega/apps/core/application/blocs/generate_bloc.dart';
import 'package:vega/apps/core/application/states/generate_state.dart';
import 'package:vega/apps/core/presentation/screens/generating_screen.dart';
import 'package:vega/apps/core/presentation/screens/select_era_screen.dart';
import 'package:vega/apps/core/presentation/screens/select_genre_screen.dart';
import 'package:vega/apps/core/presentation/screens/select_instruments_screen.dart';
import 'package:vega/apps/core/presentation/screens/select_lyrics_screen.dart';
import 'package:vega/apps/core/presentation/screens/select_mood_screen.dart';
import 'package:vega/lib/utils/routing.dart';
import 'package:vega/lib/widgets/screens/bloc_screen.dart';

class GenerateScreen extends AsyncBlocScreen<GenerateBloc, GenerateState>{

  final Map<QueryStage, Widget Function(BuildContext context, GenerateState state)> stageMap = {
    QueryStage.genre: (BuildContext context, GenerateState state) => const SelectGenreScreen(),
    QueryStage.era: (BuildContext context, GenerateState state) => const SelectEraScreen(),
    QueryStage.lyricsType: (BuildContext context, GenerateState state) => const SelectLyricsScreen(),
    QueryStage.instruments: (BuildContext context, GenerateState state) => SelectInstrumentsScreen(),
    QueryStage.mood: (BuildContext context, GenerateState state) => const SelectMoodScreen(),
    QueryStage.generating: (BuildContext context, GenerateState state) => GeneratingScreen(state.query),

  };

  GenerateScreen({super.key});

  @override
  GenerateBloc onCreateBloc(GenerateState state) {
    return GenerateBloc(state);
  }

  @override
  Widget onCreateMain(BuildContext context, GenerateState state) {
    if(state.stage == QueryStage.cancel){
      RoutingUtils.redirect("/", context);
      return const SizedBox.shrink();
    }
    if(state.stage == QueryStage.play){
      RoutingUtils.redirect("/core/play", context, extra: state.songId!);
      return const SizedBox.shrink();
    }
    return Expanded(
        child: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 600),
          reverse: false,
          transitionBuilder: (Widget child, Animation<double> animation, Animation<double> secondaryAnimation) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          child: stageMap[state.stage]!(context, state),
      )
    );
  }

  @override
  GenerateState onCreateState() {
    return GenerateState();
  }

}