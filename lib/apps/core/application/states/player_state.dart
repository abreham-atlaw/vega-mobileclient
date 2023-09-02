


import 'package:audio_service/audio_service.dart';
import 'package:flutter/rendering.dart';
import 'package:vega/apps/core/data/models/song.dart';
import 'package:vega/lib/async_bloc/base_state.dart';

class PlayerState extends BaseState{

  Song? song;
  String? songId;

  Stream<Duration>? currentPosition;
  Stream<Duration>? duration;
  Stream<bool>? isPlaying;

  @override
  BaseState newInstance() {
    return PlayerState();
  }

  @override
  void copyProperties(BaseState newState) {
    super.copyProperties(newState);
    (newState as PlayerState).song = song;
    newState.songId = songId;
    newState.duration = duration;
    newState.currentPosition = currentPosition;
    newState.isPlaying = isPlaying;
  }

}