import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/features/core/data/models/song.dart';
import 'package:vega/features/player/application/events/player_events.dart';
import 'package:vega/features/player/application/states/player_state.dart';
import 'package:vega/features/core/application/utils/audio_handler.dart';
import 'package:vega/features/core/data/repositories/library_repository.dart';
import 'package:vega/dependency_injection/core.dart';
import 'package:vega/common/async_bloc/async_bloc.dart';

class PlayerBloc extends AsyncBloc<PlayerState>{

  final LibraryRepository _songRepository = LibraryRepository();
  Future<VegaAudioHandler> get _audioHandler => CoreProviders.provideAudioHandler();

  PlayerBloc(super.initialState){
    on<PlayEvent>(_handlePlay);
    on<PauseEvent>(_handlePause);
    on<CurrentPositionChangedEvent>(_handleCurrentPositionChanged);
    on<IsPlayingChangedEvent>(_handleIsPlayingChanged);
    on<SongChangedEvent>(_handleSongChanged);
    on<PlaySongByIdEvent>(_handlePlaySongById);
    on<NextEvent>(_handleNext);
    on<PreviousEvent>(_handlePrevious);
  }

  @override
  Future<void> onInit() async{
    await super.onInit();
    await (await _audioHandler).initialize();

    state.isPlaying = (await _audioHandler).isPlayingNow;

    state.song = (await _audioHandler).currentSong;
    await _setupListeners();

  }

  Future<void> _setupListeners() async{
    (await _audioHandler).currentPosition.listen((event) {
      add(CurrentPositionChangedEvent(event));
    });
    (await _audioHandler).isPlayingListener.listen((event) {
      add(IsPlayingChangedEvent(event));
    });
    (await _audioHandler).songChangedListener.listen((event) {
      add(SongChangedEvent(event));
    });

  }

  Future<void> _handlePlay(PlayEvent event, Emitter emitter) async{
    await (await _audioHandler).play();
  }

  Future<void> _handlePause(PauseEvent event, Emitter emitter) async{
    await (await _audioHandler).pause();
  }

  Future<void> _handleIsPlayingChanged(IsPlayingChangedEvent event, Emitter emitter) async{
    state.isPlaying = event.isPlaying;
    syncState(emitter);
  }

  Future<void> _handleCurrentPositionChanged(CurrentPositionChangedEvent event, Emitter emitter) async{
    state.currentPosition = event.position;
    syncState(emitter);
  }

  Future<void> _handleSongChanged(SongChangedEvent event, Emitter emitter) async{
    state.song = event.song;
    syncState(emitter);
  }

  Future<void> _handlePlaySongById(PlaySongByIdEvent event, Emitter emitter) async{
    Song song = await _songRepository.getSong(event.songId);
    (await _audioHandler).playSong(song);
  }

  Future<void> _handlePrevious(PreviousEvent event, Emitter emitter) async{
    await (await _audioHandler).previous();
  }

  Future<void> _handleNext(NextEvent event, Emitter emitter) async{
    await (await _audioHandler).next();
  }

  @override
  Future<void> close() {
    return super.close();
  }

}