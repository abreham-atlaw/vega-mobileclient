

import 'package:audio_service/audio_service.dart';
import 'package:vega/common/async_bloc/async_events.dart';
import 'package:vega/features/core/data/models/song.dart';

class PlayerBaseEvent extends AsyncEvent{

}

class PlaySongByIdEvent extends PlayerBaseEvent{

  final String songId;
  PlaySongByIdEvent(this.songId);

}

class PlayEvent extends PlayerBaseEvent{

}

class PauseEvent extends PlayerBaseEvent{

}

class PlaybackStateChangedEvent extends PlayerBaseEvent{

  final PlaybackState playbackState;

  PlaybackStateChangedEvent(this.playbackState);

}

class DurationChangedEvent extends PlayerBaseEvent{

  final Duration duration;

  DurationChangedEvent(this.duration);

}

class CurrentPositionChangedEvent extends PlayerBaseEvent{

  final Duration position;

  CurrentPositionChangedEvent(this.position);

}


class IsPlayingChangedEvent extends PlayerBaseEvent{

  final bool isPlaying;

  IsPlayingChangedEvent(this.isPlaying);

}


class SongChangedEvent extends PlayerBaseEvent{

  final Song song;

  SongChangedEvent(this.song);

}


class NextEvent extends PlayerBaseEvent{

}

class PreviousEvent extends PlayerBaseEvent{

}