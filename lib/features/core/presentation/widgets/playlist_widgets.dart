


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/common/widgets/buttons/circular_icon_button.dart';
import 'package:vega/common/widgets/containers/percentage_container.dart';
import 'package:vega/common/widgets/containers/width_height_container.dart';
import 'package:vega/common/widgets/navigation/link.dart';
import 'package:vega/common/widgets/text/body.dart';
import 'package:vega/common/widgets/text/headers.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/features/core/application/blocs/playlist_bloc.dart';
import 'package:vega/features/core/application/events/playlist_events.dart';
import 'package:vega/features/core/data/models/playlist.dart';
import 'package:vega/features/core/data/models/song.dart';



class PlaylistTopWidget extends StatelessWidget{

  final Playlist _playlist;

  const PlaylistTopWidget(this._playlist, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidthSizedHeightContainer(
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(SpacingConfigs.spacing1)),
                image: DecorationImage(
                    image: NetworkImage(_playlist.cover)
                )
            ),
          ),
        ),
        const SizedBox(height: SpacingConfigs.spacing3,),
        Heading2(_playlist.title, textAlign: TextAlign.center,),
        Heading4("Jermaine Cole"),
        const SizedBox(height: SpacingConfigs.spacing3,),
        BodyText("${_playlist.songs.length} Songs"),
        const SizedBox(height: SpacingConfigs.spacing3,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.download_for_offline_outlined, color: ColorsConfigs.light,),
            CircularIconButton(
                icon: Icons.play_arrow,
                onPressed: (){
                  context.read<PlaylistBloc>().add(PlayPlaylistEvent());
                }
            ),
            const Icon(Icons.reply_outlined, color: ColorsConfigs.light,)
          ],
        )
      ],
    );
  }

}


class SongWidget extends StatelessWidget{
  
  final Song _song;
  
  const SongWidget(this._song, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Link(
      to: "/player/play",
      extra: _song.id,
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          PercentageContainer(
            width: 0.15,
            child: Image.network(_song.coverImageUrl),
          ),
          PercentageContainer(
            width: 0.05,
          ),
          PercentageContainer(
              width:0.65,
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: SpacingConfigs.spacing1,),
                  BodyText(_song.title),
                  const SizedBox(height: SpacingConfigs.spacing1,),
                  BodyText(
                    "Vega",
                    fontSize: FontSizeConfigs.size0,
                  )
                ],
              )
          ),
          PercentageContainer(
            width: 0.15,
            child: BodyText("0:15"),
          )
        ],
      ),
    );
  }
  
}