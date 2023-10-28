


import 'package:vega/features/core/data/models/playlist.dart';
import 'package:vega/features/generation/data/models/generate_query_sample.dart';
import 'package:vega/features/core/data/models/song.dart';
import 'package:vega/common/async_bloc/base_state.dart';

class HomeState extends BaseState{

  List<GenerateQuerySample>? recommendations;
  List<Song>? recent;
  List<GenerateQuerySample>? populars;
  List<Playlist>? playlists;

  @override
  BaseState newInstance() {
    return HomeState();
  }

  @override
  void copyProperties(BaseState newState) {
    super.copyProperties(newState);
    (newState as HomeState).recommendations = recommendations;
    newState.populars = populars;
    newState.recent = recent;
    newState.playlists = playlists;
  }

}

