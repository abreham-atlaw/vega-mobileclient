


import 'package:vega/common/async_bloc/async_bloc.dart';
import 'package:vega/dependency_injection/core.dart';
import 'package:vega/features/core/data/repositories/library_repository.dart';
import 'package:vega/features/player/application/states/play_song_state.dart';

class PlaySongBloc extends AsyncBloc<PlaySongState>{

  final LibraryRepository _libraryRepository  = LibraryRepository();

  PlaySongBloc(super.initialState);

  @override
  Future<void> onInit() async{
    await super.onInit();
    state.song = await _libraryRepository.getSong(state.songId);
    (await CoreProviders.provideAudioHandler()).playSong(state.song!);
  }

}