

import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vega/apps/core/data/models/song.dart';

class VegaAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler{

  Song? currentSong;
  final AudioPlayer _player = AudioPlayer();

  VegaAudioHandler();

  Stream<Duration> get duration {
    return _player.onDurationChanged;
  }

  Stream<Duration> get currentPosition{
    return _player.onPositionChanged;
  }


  initialize() async{
    _player.onPositionChanged.listen((event) {
      playbackState.add(PlaybackState(
          updatePosition: event
      ));
    });
    _player.onPlayerComplete.listen((event) {
      playbackState.add(PlaybackState(
        playing: false
      ));
    });
  }



  @override
  Future<void> play() async{
    await _player.resume();
    playbackState.add(PlaybackState(
      playing: true,
    ));

  }

  Future<void> pause() async{
    await _player.pause();
    playbackState.add(PlaybackState(
      playing: false
    ));
  }

  Future<void> seek(Duration position) async{
    await _player.seek(position);
  }

  Future<void> playSong(Song song) async{
    currentSong = song;
    await _player.setSourceUrl(currentSong!.audioUrl);
    await play();
  }



}