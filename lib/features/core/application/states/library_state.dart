


import 'package:vega/common/async_bloc/base_state.dart';
import 'package:vega/features/core/data/models/playlist.dart';
import 'package:vega/features/core/data/models/song.dart';
import 'package:vega/features/core/presentation/widgets/library_widgets.dart';

class LibraryState extends BaseState{

  List<Song>? recent;
  List<Playlist>? playlists;

  LibraryPage page = LibraryPage.recent;

  @override
  BaseState newInstance() {
    return LibraryState();
  }

  @override
  void copyProperties(BaseState newState) {
    super.copyProperties(newState);
    (newState as LibraryState).recent = recent;
    newState.playlists = playlists;
    newState.page = page;
  }

}