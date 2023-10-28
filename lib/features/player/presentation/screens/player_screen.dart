import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/features/player/application/blocs/player_bloc.dart';
import 'package:vega/features/player/application/states/player_state.dart';
import 'package:vega/features/player/presentation/widgets/player_widgets.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/common/utils/routing.dart';
import 'package:vega/common/widgets/screens/bloc_screen.dart';
import 'package:vega/common/widgets/text/body.dart';


class PlayerScreen extends AsyncBlocScreen<PlayerBloc, PlayerState>{
  const PlayerScreen({super.key});

  @override
  PlayerBloc onCreateBloc(PlayerState state) {
    return PlayerBloc(state);
  }

  @override
  Widget onCreateMain(BuildContext context, PlayerState state) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(

        image: (state.song != null) ? DecorationImage(
          image: NetworkImage(
            state.song!.coverImageUrl
          ),
          fit: BoxFit.cover
        ) : null,

        color: ColorsConfigs.primaryDark
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
              Container(
                child: IconButton(
                  onPressed: () {
                    RoutingUtils.redirect("/core/home", context);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorsConfigs.light,
                  ),
                ),
              ),
              Expanded(
                child: (state.song != null) ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: SpacingConfigs.spacing7,
                      horizontal: SpacingConfigs.spacing5
                    ),
                    child: BodyText(
                      state.song!.lyrics,
                      overflow: TextOverflow.clip,
                      fontSize: FontSizeConfigs.size2,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 2,
                    ),
                  ),
                ) : const SizedBox.expand(),
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
                            state.song?.title ?? "No Track",
                          fontSize: FontSizeConfigs.size2,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: SpacingConfigs.spacing3,
                    ),
                    AudioSeekingWidget(
                        state.song?.duration ?? Duration.zero,
                        state.currentPosition
                    ),
                    const SizedBox(
                      height: SpacingConfigs.spacing3,
                    ),
                    PlayerControllerWidget(
                        isPlaying: state.isPlaying,
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
    return PlayerState();
  }

}