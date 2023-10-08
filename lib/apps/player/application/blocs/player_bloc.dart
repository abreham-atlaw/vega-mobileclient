import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/apps/player/application/events/player_events.dart';
import 'package:vega/apps/player/application/states/player_state.dart';
import 'package:vega/apps/core/application/utils/audio_handler.dart';
import 'package:vega/apps/core/data/repositories/song_repository.dart';
import 'package:vega/di/core.dart';
import 'package:vega/lib/async_bloc/async_bloc.dart';

class PlayerBloc extends AsyncBloc<PlayerState>{

  final SongRepository _songRepository = SongRepository();
  Future<VegaAudioHandler> get _audioHandler => CoreProviders.provideAudioHandler();

  PlayerBloc(super.initialState){
    on<PlayEvent>(_handlePlay);
    on<CurrentPositionChangedEvent>(_handleCurrentPositionChanged);
    on<DurationChangedEvent>(_handleDurationChanged);
    on<IsPlayingChangedEvent>(_handleIsPlayingChanged);
  }

  @override
  Future<void> onInit() async{
    await super.onInit();
    await (await _audioHandler).initialize();

    if(state.songId == null){
      state.song = (await _audioHandler).currentSong;
      state.songId = state.song!.id;
    }
    else{
      state.song = await _songRepository.getSong(state.songId!);
      (await _audioHandler).playSong(state.song!);
    }

    state.duration = await (await _audioHandler).duration;

    await _setupListeners();

  }

  Future<void> _setupListeners() async{
    (await _audioHandler).durationListener.listen((event) {
      add(DurationChangedEvent(event));
    });
    (await _audioHandler).currentPosition.listen((event) {
      add(CurrentPositionChangedEvent(event));
    });
    (await _audioHandler).isPlayingListener.listen((event) {
      add(IsPlayingChangedEvent(event));
    });
  }

  Future<void> _handlePlay(PlayEvent event, Emitter emitter) async{
    await (await _audioHandler).play();
  }

  Future<void> _handleIsPlayingChanged(IsPlayingChangedEvent event, Emitter emitter) async{
    state.isPlaying = event.isPlaying;
    syncState(emitter);
  }

  Future<void> _handleCurrentPositionChanged(CurrentPositionChangedEvent event, Emitter emitter) async{
    state.currentPosition = event.position;
    syncState(emitter);
  }

  Future<void> _handleDurationChanged(DurationChangedEvent event, Emitter emitter) async{
    state.duration = event.duration;
    syncState(emitter);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}