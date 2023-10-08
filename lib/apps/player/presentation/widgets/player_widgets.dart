import 'package:flutter/material.dart';
import 'package:vega/apps/player/application/blocs/player_bloc.dart';
import 'package:vega/apps/player/application/events/player_events.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/lib/widgets/buttons/circular_icon_button.dart';
import 'package:vega/lib/widgets/containers/percentage_container.dart';
import 'package:vega/lib/widgets/text/body.dart';

class AudioSeekingWidget extends StatelessWidget {
  final Duration duration;
  final Duration position;

  const AudioSeekingWidget(this.duration, this.position, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = position.inMilliseconds / duration.inMilliseconds;
    if (duration.inSeconds == 0) {
      progress = 0;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BodyText(
                "${position.inMinutes}: ${position.inSeconds.remainder(60).toString().padLeft(2, "0")}"),
            BodyText(
                "${duration.inMinutes}: ${duration.inSeconds.remainder(60).toString().padLeft(2, "0")}"),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          height: 5.0,
          color: ColorsConfigs.light,
          child: Stack(
            children: [
              PercentageContainer(
                width: progress,
                child: Container(
                  color: ColorsConfigs.primary,
                ),
              )
              ,
            ],
          )
        ),
      ],
    );
  }
}


class PlayerControllerWidget extends StatelessWidget {
  final PlayerBloc bloc;
  final bool isPlaying;

  const PlayerControllerWidget({super.key,
    required this.isPlaying,
    required this.bloc
  });

  void onPrevious(){

  }

  void onNext(){

  }

  void onPause() async{
    PlayerBaseEvent event;
    if(isPlaying){
      event = PauseEvent();
    }
    else{
      event = PlayEvent();
    }
    bloc.add(event);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.skip_previous, color: ColorsConfigs.light),
          onPressed: onPrevious,
        ),
        CircularIconButton(
            icon: (isPlaying) ? Icons.pause : Icons.play_arrow,
            onPressed: onPause
        ),
        IconButton(
          icon: const Icon(Icons.skip_next, color: ColorsConfigs.light,),
          onPressed: onNext,
        ),
      ],
    );
  }
}