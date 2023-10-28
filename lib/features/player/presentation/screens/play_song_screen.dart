

import 'package:flutter/src/widgets/framework.dart';
import 'package:vega/common/utils/routing.dart';
import 'package:vega/common/widgets/screens/bloc_screen.dart';
import 'package:vega/common/widgets/screens/loading_screen.dart';
import 'package:vega/features/player/application/blocs/play_song_bloc.dart';
import 'package:vega/features/player/application/states/play_song_state.dart';

class PlaySongScreen extends AsyncBlocScreen<PlaySongBloc, PlaySongState>{

  final String songId;

  const PlaySongScreen(this.songId, {super.key});

  @override
  PlaySongBloc onCreateBloc(state) {
    return PlaySongBloc(state);
  }

  @override
  Widget onCreateMain(BuildContext context, state) {
    RoutingUtils.redirect("/player/player", context);
    return LoadingScreen(state);
  }

  @override
  PlaySongState onCreateState() {
    return PlaySongState(songId);
  }

}