

import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vega/apps/core/data/models/song.dart';

class VegaAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler{

  Song? currentSong;

  final StreamController<bool> _isPlayingStreamController = StreamController.broadcast();
  late Stream<bool> isPlayingListener = _isPlayingStreamController.stream;

  final AudioPlayer _player = AudioPlayer();

  VegaAudioHandler();

  Stream<Duration> get durationListener {
    return _player.onDurationChanged;
  }

  Stream<Duration> get currentPosition{
    return _player.onPositionChanged;
  }

  Future<Duration> get duration async{
    return await durationListener.first;
  }

  set isPlaying(bool isPlaying){
    _isPlayingStreamController.add(isPlaying);
  }

  initialize() async{
    _player.onPlayerComplete.listen((event) {
     isPlaying = false;
    });
  }

  @override
  Future<void> play() async{
    await _player.resume();
    isPlaying = true;
  }

  Future<void> pause() async{
    await _player.pause();
    isPlaying = false;
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