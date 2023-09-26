


import 'package:audio_service/audio_service.dart';
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
    state.duration = (await _audioHandler).duration;
    state.isPlaying = (await _audioHandler).playbackState.map(
            (playback) => playback.playing
    );
    state.currentPosition = (await _audioHandler).currentPosition;
  }

  Future<void> _handlePlay(PlayEvent event, Emitter emitter) async{
    await (await _audioHandler).play();
  }




}