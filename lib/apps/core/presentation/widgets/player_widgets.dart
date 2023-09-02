


import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:vega/apps/core/application/blocs/player_bloc.dart';
import 'package:vega/apps/core/application/events/player_events.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/lib/widgets/buttons/base_button.dart';
import 'package:vega/lib/widgets/buttons/circular_icon_button.dart';
import 'package:vega/lib/widgets/text/body.dart';

class AudioSeekingWidget extends StatelessWidget {

  final Stream<Duration> duration;
  final Stream<Duration> position;
  
  const AudioSeekingWidget(this.duration, this.position, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
        stream: duration,
        builder: (BuildContext context,
            AsyncSnapshot<Duration> durationSnapshot) {
          Duration duration = durationSnapshot.data ?? Duration.zero;
          return StreamBuilder<Duration>(
            stream: position,
            builder: (context, snapshot) {
              Duration position = snapshot.data ?? Duration.zero;

              double progress;
              progress = position.inMilliseconds / duration.inMilliseconds;
              if(duration.inSeconds == 0){
                progress = 0;
              }
              if(progress == 0){
                int x = 1;
              }
              return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BodyText("${position.inMinutes}: ${position.inSeconds.remainder(60).toString().padLeft(2, "0")}"),
                        BodyText("${duration.inMinutes}: ${duration.inSeconds.remainder(60).toString().padLeft(2, "0")}"),
                      ],
                    ),
                    const SizedBox(
                      height: SpacingConfigs.spacing1,
                    ),
                    Container(
                      width: double.infinity,
                      height: 8.0,
                      color: Colors.white,
                      child: Stack(
                        children: [
                          LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              double width = constraints.maxWidth;
                              return Container(
                                width: width * progress,
                                color: ColorsConfigs.primary,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
            }
          );
        }
    );
  }
}


class PlayerControllerWidget extends StatelessWidget {
  final PlayerBloc bloc;
  final Stream<bool> isPlaying;

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
    if(await isPlaying.last){
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
        StreamBuilder<bool>(
          stream: isPlaying,
          builder: (context, snapshot) {
            return CircularIconButton(
                icon: snapshot.data! ? Icons.pause : Icons.play_arrow,
                onPressed: onPause
            );
          }
        ),
        IconButton(
          icon: const Icon(Icons.skip_next, color: ColorsConfigs.light,),
          onPressed: onNext,
        ),
      ],
    );
  }
}