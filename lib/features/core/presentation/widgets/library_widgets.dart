import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/common/widgets/containers/percentage_container.dart';
import 'package:vega/common/widgets/navigation/link.dart';
import 'package:vega/common/widgets/text/body.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/features/core/application/blocs/library_bloc.dart';
import 'package:vega/features/core/application/events/library_events.dart';
import 'package:vega/features/core/data/models/playlist.dart';
import 'package:vega/features/core/data/models/song.dart';
import 'package:vega/features/core/presentation/widgets/playlist_widgets.dart';

enum LibraryPage{
  
  recent, 
  playlists
  
}

class LibraryMenuBar extends StatelessWidget{

  final LibraryPage _page;
  final Map<LibraryPage, String> _pageMap = {
    LibraryPage.recent: "RECENT",
    LibraryPage.playlists: "PLAYLISTS"
  };

  LibraryMenuBar(this._page, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: LibraryPage.values.map((page) =>
        GestureDetector(
          onTap: (){
            context.read<LibraryBloc>().add(SwitchPageEvent(page));
          },
          child: Container(
            decoration: BoxDecoration(
              border: (_page == page) ? const Border(
                bottom: BorderSide(
                  color: ColorsConfigs.primary,
                  width: 4
                )
              ) : null
            ),
            margin: const EdgeInsets.only(right: SpacingConfigs.spacing3),
            padding: const EdgeInsets.only(right: SpacingConfigs.spacing3),
            child: BodyText(
              _pageMap[page]
            ),
          ),
        )
      ).toList(),
    );
  }
}


class LibraryPlaylistWidget extends StatelessWidget{

  final Playlist _playlist;

  const LibraryPlaylistWidget(this._playlist, {super.key});

  @override
  Widget build(BuildContext context) {
    return Link(
      to: "/core/playlist/",
      extra: _playlist.id,
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          PercentageContainer(
            width: 0.15,
            child: Image.network(_playlist.cover),
          ),
          PercentageContainer(
            width: 0.05,
          ),
          PercentageContainer(
              width:0.8,
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: SpacingConfigs.spacing1,),
                  BodyText(_playlist.title),
                  const SizedBox(height: SpacingConfigs.spacing1,),
                  BodyText(
                    "Jermaine Cole",
                    fontSize: FontSizeConfigs.size0,
                  )
                ],
              )
          ),
        ],
      ),
    );
  }

}


class RecentPageWidget extends StatelessWidget{

  final List<Song> _songs;

  const RecentPageWidget(this._songs, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _songs.map((song) =>
          Container(
              margin: const EdgeInsets.symmetric(vertical: SpacingConfigs.spacing1),
              child: SongWidget(song)
          )).toList(),
    );
  }

}


class PlaylistsPageWidget extends StatelessWidget{

  final List<Playlist> _playlists;

  const PlaylistsPageWidget(this._playlists, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _playlists.map((playlist) =>
          Container(
            margin: const EdgeInsets.symmetric(vertical: SpacingConfigs.spacing1),
            child: LibraryPlaylistWidget(playlist)
          )
      ).toList(),
    );
  }

}