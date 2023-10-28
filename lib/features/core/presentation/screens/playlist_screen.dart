


import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vega/common/widgets/containers/percentage_container.dart';
import 'package:vega/common/widgets/screens/bloc_screen.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/features/core/application/blocs/playlist_bloc.dart';
import 'package:vega/features/core/application/states/playlist_state.dart';
import 'package:vega/features/core/presentation/widgets/bottom_nav_bar.dart';
import 'package:vega/features/core/presentation/widgets/playlist_widgets.dart';

class PlaylistScreen extends AsyncBlocScreen<PlaylistBloc, PlaylistState>{

  final String _playlistId;

  const PlaylistScreen(this._playlistId, {super.key});

  @override
  PlaylistBloc onCreateBloc(PlaylistState state) {
    return PlaylistBloc(state);
  }

  @override
  Widget onCreateMain(BuildContext context, PlaylistState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingConfigs.spacing2),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: SpacingConfigs.spacing5,),
            Container(
              child: PercentageContainer(
                  width: 0.6,
                  child: PlaylistTopWidget(state.playlist!)
              ),
            ),
            const SizedBox(
              height: SpacingConfigs.spacing7,
            ),
            Column(
              children: state.playlist!.songs.map((song) => Container(
                  margin: const EdgeInsets.symmetric(vertical: SpacingConfigs.spacing1),
                  child: SongWidget(song)
              )).toList(),
            )
          ],
        ),
      ),
    );
  }

  @override
  PlaylistState onCreateState() {
    return PlaylistState(_playlistId);
  }



}