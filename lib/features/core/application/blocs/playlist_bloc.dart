


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/common/async_bloc/async_bloc.dart';
import 'package:vega/dependency_injection/core.dart';
import 'package:vega/features/core/application/events/playlist_events.dart';
import 'package:vega/features/core/application/states/playlist_state.dart';
import 'package:vega/features/core/application/utils/audio_handler.dart';
import 'package:vega/features/core/data/repositories/library_repository.dart';

class PlaylistBloc extends AsyncBloc<PlaylistState>{

  final LibraryRepository _repository = LibraryRepository();
  final Future<VegaAudioHandler> _audioHandler = CoreProviders.provideAudioHandler();

  PlaylistBloc(super.initialState){
    on<PlayPlaylistEvent>(_handlePlay);
  }

  @override
  Future<void> onInit() async{
    await super.onInit();
    state.playlist = await _repository.getPlaylist(state.playlistId);
  }

  Future<void> _handlePlay(PlayPlaylistEvent event, Emitter emitter) async{
    (await _audioHandler).playPlaylist(state.playlist!);
  }



}