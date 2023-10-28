import 'package:vega/features/core/data/models/song.dart';
import 'package:vega/common/async_bloc/base_state.dart';

class PlayerState extends BaseState{

  Song? song;

  Duration currentPosition = const Duration(seconds: 0);
  bool isPlaying = false;

  @override
  BaseState newInstance() {
    return PlayerState();
  }

  @override
  void copyProperties(BaseState newState) {
    super.copyProperties(newState);
    (newState as PlayerState).song = song;
    newState.currentPosition = currentPosition;
    newState.isPlaying = isPlaying;
  }

}