


import 'package:vega/common/async_bloc/base_state.dart';
import 'package:vega/features/core/data/models/song.dart';

class PlaySongState extends BaseState{

  String songId;
  Song? song;

  PlaySongState(this.songId);

  @override
  BaseState newInstance() {
    return PlaySongState(songId);
  }

  @override
  void copyProperties(BaseState newState) {
    super.copyProperties(newState);
    (newState as PlaySongState).songId = songId;
    newState.song = song;
  }

}

