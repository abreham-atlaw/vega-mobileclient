


import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/common/widgets/containers/async_container.dart';
import 'package:vega/common/widgets/containers/percentage_container.dart';
import 'package:vega/common/widgets/navigation/link.dart';
import 'package:vega/common/widgets/screens/bloc_screen.dart';
import 'package:vega/common/widgets/text/body.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/features/player/application/blocs/player_bloc.dart';
import 'package:vega/features/player/application/states/player_state.dart';
import 'package:vega/features/player/presentation/widgets/player_widgets.dart';

class BottomPlayerBar extends StatelessWidget{

  const BottomPlayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Link(
      to: "/player/player",
      child: AsyncContainer(
          state: PlayerState(),
          blocBuilder: (context, state) => PlayerBloc(state),
          builder: (context, state) => Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: ColorsConfigs.primaryDark,
            ),
            padding: const EdgeInsets.all(SpacingConfigs.spacing2),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                PercentageContainer(
                  width: 0.13,
                  child: (state.song != null) ?
                  Image.network(state.song?.coverImageUrl??""):
                      null
                ),
                PercentageContainer(
                  width: 0.02
                ),
                PercentageContainer(
                  width: 0.45,
                  child: BodyText(state.song?.title ?? "", fontWeight: FontWeight.w800)
                ),
                PercentageContainer(
                  width: 0.4,
                  child: PlayerControllerWidget(
                      isPlaying: state.isPlaying,
                      bloc: context.read<PlayerBloc>(),
                      iconSize: FontSizeConfigs.size2,
                  )
                )
              ],
            ),
          )
      ),
    );
  }

}