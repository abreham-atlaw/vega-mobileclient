


import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/apps/player/application/blocs/player_bloc.dart';
import 'package:vega/apps/player/application/states/player_state.dart';
import 'package:vega/apps/player/presentation/widgets/player_widgets.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/lib/widgets/containers/percentage_container.dart';
import 'package:vega/lib/widgets/screens/bloc_screen.dart';
import 'package:vega/lib/widgets/text/body.dart';
import 'package:vega/lib/widgets/text/headers.dart';

class PlayerScreen extends AsyncBlocScreen<PlayerBloc, PlayerState>{

  final String? songId;

  const PlayerScreen({
    this.songId,
    super.key
  });


  @override
  PlayerBloc onCreateBloc(PlayerState state) {
    return PlayerBloc(state);
  }

  @override
  Widget onCreateMain(BuildContext context, PlayerState state) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(

        image: DecorationImage(
          image: NetworkImage(
            state.song!.coverImageUrl
          ),
          fit: BoxFit.cover
        )
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  ColorsConfigs.dark
                ]
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(

                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: SpacingConfigs.spacing7
                    ),
                    child: BodyText(
                      state.song!.lyrics,
                      overflow: TextOverflow.clip,
                      fontSize: FontSizeConfigs.size1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: SpacingConfigs.spacing7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SpacingConfigs.spacing5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        BodyText(
                            state.song!.title,
                          fontSize: FontSizeConfigs.size2,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: SpacingConfigs.spacing3,
                    ),
                    AudioSeekingWidget(
                        state.duration!,
                        state.currentPosition!
                    ),
                    const SizedBox(
                      height: SpacingConfigs.spacing3,
                    ),
                    PlayerControllerWidget(
                        isPlaying: state.isPlaying!,
                        bloc: context.read<PlayerBloc>(),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: SpacingConfigs.spacing7,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  PlayerState onCreateState() {
    PlayerState state = PlayerState();
    state.songId = songId;
    return state;
  }

}