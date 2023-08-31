

import 'package:vega/apps/core/application/states/select_genre_state.dart';
import 'package:vega/apps/core/data/repositories/song_repository.dart';
import 'package:vega/lib/async_bloc/async_bloc.dart';

class SelectGenreBloc extends AsyncBloc<SelectGenreState>{

  final SongRepository _songRepository = SongRepository();

  SelectGenreBloc(super.initialState);

  @override
  Future<void> onInit() async{
    await super.onInit();
    state.genres = await _songRepository.getGenres();
  }

}