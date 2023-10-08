

import 'package:audio_service/audio_service.dart';
import 'package:vega/lib/async_bloc/async_events.dart';

class PlayerBaseEvent extends AsyncEvent{

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
