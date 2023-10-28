


import 'package:vega/common/async_bloc/base_state.dart';
import 'package:vega/features/core/data/models/playlist.dart';

class PlaylistState extends BaseState{

  Playlist? playlist;
  String playlistId;

  PlaylistState(this.playlistId);

  @override
  BaseState newInstance() {
    return PlaylistState(playlistId);
  }

  @override
  void copyProperties(BaseState newState) {
    super.copyProperties(newState);
    (newState as PlaylistState).playlist = playlist;
  }

}