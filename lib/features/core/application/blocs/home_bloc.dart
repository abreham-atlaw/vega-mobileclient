import 'package:vega/features/core/application/states/home_state.dart';
import 'package:vega/features/generation/data/models/generate_query_sample.dart';
import 'package:vega/features/core/data/repositories/library_repository.dart';
import 'package:vega/common/async_bloc/async_bloc.dart';
import 'package:vega/features/generation/data/repositories/query_sample_repository.dart';

class HomeBloc extends AsyncBloc<HomeState>{

  final LibraryRepository _libraryRepository = LibraryRepository();
  final GenerationRepository _generationRepository = GenerationRepository();

  HomeBloc(super.initialState);

  @override
  Future<void> onInit() async{
    await super.onInit();


    state.recent = await _libraryRepository.getRecent();
    state.playlists = await _libraryRepository.getAllPlaylists();
    state.recommendations = await _generationRepository.getRecommendations();
    }

}