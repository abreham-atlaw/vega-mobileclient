


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/apps/core/application/events/generate_events.dart';
import 'package:vega/apps/core/application/states/generate_state.dart';
import 'package:vega/apps/core/data/repositories/song_repository.dart';
import 'package:vega/lib/async_bloc/async_bloc.dart';

class GenerateBloc extends AsyncBloc<GenerateState>{

  List<QueryStage> stageOrder = [
    QueryStage.cancel,
    QueryStage.genre,
    QueryStage.era,
    QueryStage.mood,
    QueryStage.instruments,
    QueryStage.lyricsType,
    QueryStage.generate,
    QueryStage.play
  ];

  final SongRepository _songRepository = SongRepository();

  GenerateBloc(super.initialState){
    on<SkipEvent>(_handleSkip);
    on<BackEvent>(_handleBack);
    on<SelectGenreEvent>(_handleSelectGenre);
    on<SelectEraEvent>(_handleSelectEra);
    on<SelectLyricsTypeEvent>(_handleSelectLyricsTypes);
    on<SelectInstrumentsEvent>(_handleSelectInstruments);
    on<SelectMoodEvent>(_handleSelectMood);
    on<PlayEvent>(_handleGenerated);

  }

  void nextStage(){
    state.stage = stageOrder[stageOrder.indexOf(state.stage) + 1];

  }

  void previousStage(){
    state.stage = stageOrder[stageOrder.indexOf(state.stage) - 1];
  }

  Future<void> _handleSelectGenre(SelectGenreEvent event, Emitter emitter) async{
    state.query.genre = event.genre;
    nextStage();
    syncState(emitter);
  }

  Future<void> _handleSelectEra(SelectEraEvent event, Emitter emitter) async{
    state.query.era = event.era;
    nextStage();
    syncState(emitter);
  }

  Future<void> _handleSelectMood(SelectMoodEvent event, Emitter emitter) async{
    state.query.mood = event.mood;
    nextStage();
    syncState(emitter);
  }

  Future<void> _handleSelectInstruments(SelectInstrumentsEvent event, Emitter emitter) async{
    state.query.instruments = event.instruments;
    nextStage();
    syncState(emitter);
  }

  Future<void> _handleSelectLyricsTypes(SelectLyricsTypeEvent event, Emitter emitter) async{
    state.query.lyricsType = event.lyricsTypes;
    nextStage();
    syncState(emitter);
  }

  Future<void> _handleGenerated(PlayEvent event, Emitter emitter) async{
    state.songId = event.songId;
    nextStage();
    syncState(emitter);
  }

  Future<void> _handleSkip(SkipEvent event, Emitter emitter) async{
    nextStage();
    syncState(emitter);
  }


  Future<void> _handleBack(BackEvent event, Emitter emitter) async{
    previousStage();
    syncState(emitter);
  }

}