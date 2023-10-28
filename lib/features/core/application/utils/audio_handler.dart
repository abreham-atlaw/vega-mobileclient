import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vega/features/core/data/models/playlist.dart';
import 'package:vega/features/core/data/models/song.dart';

class VegaAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler{

  List<Song> songQueue = [];
  int currentSongIndex = 0;

  final StreamController<bool> _isPlayingStreamController = StreamController.broadcast();
  late Stream<bool> isPlayingListener = _isPlayingStreamController.stream;
  bool isPlayingNow = false;

  final StreamController<Song> _currentSongStreamController = StreamController.broadcast();
  late Stream<Song> songChangedListener = _currentSongStreamController.stream;

  final AudioPlayer _player = AudioPlayer();

  VegaAudioHandler();

  Song? get currentSong{
    if(songQueue.isEmpty || currentSongIndex >= songQueue.length) {
      return null;
    }
    return songQueue[currentSongIndex];

  }

  Stream<Duration> get currentPosition{
    return _player.onPositionChanged;
  }

  set isPlaying(bool isPlaying){
    _isPlayingStreamController.add(isPlaying);
    isPlayingNow = isPlaying;
  }

  initialize() async{
    _player.onPlayerComplete.listen((event) {
     onPlayerComplete();
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

  Future<void> next() async{
    await playIndex(currentSongIndex + 1);
  }

  Future<void> previous() async{
    await playIndex(currentSongIndex - 1);
  }

  Future<void> addToQueue(Song song) async{
    songQueue.add(song);
  }

  Future<void> playIndex(int index) async{
    currentSongIndex = index;
    await _player.setSourceUrl(currentSong!.audioUrl);
    await play();
    _currentSongStreamController.add(currentSong!);
  }

  Future<void> playSong(Song song) async{
    addToQueue(song);
    playIndex(songQueue.length - 1);
  }

  Future<void> playPlaylist(Playlist playlist) async{
    songQueue = playlist.songs;
    playIndex(0);
  }

  onPlayerComplete(){
    if(currentSongIndex == songQueue.length - 1){
      isPlaying = false;
    }
    next();
  }

}