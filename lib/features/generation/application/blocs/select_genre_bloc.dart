

import 'package:vega/features/generation/application/states/select_genre_state.dart';
import 'package:vega/features/core/data/repositories/library_repository.dart';
import 'package:vega/common/async_bloc/async_bloc.dart';

class SelectGenreBloc extends AsyncBloc<SelectGenreState>{

  final LibraryRepository _songRepository = LibraryRepository();

  SelectGenreBloc(super.initialState);

  @override
  Future<void> onInit() async{
    await super.onInit();
    state.genres = await _songRepository.getGenres();
  }

}