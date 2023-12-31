

import 'package:vega/features/generation/data/models/generate_query.dart';
import 'package:vega/common/async_bloc/base_state.dart';

enum QueryStage{
  cancel,
  genre,
  era,
  mood,
  instruments,
  lyricsType,
  generate,
  play
}

class GenerateState extends BaseState{

  GenerateQuery query = GenerateQuery();

  QueryStage stage = QueryStage.genre;
  String? songId;

  @override
  BaseState newInstance() {
    return GenerateState();
  }

  @override
  void copyProperties(BaseState newState) {
    super.copyProperties(newState);
    (newState as GenerateState).query = query;
    newState.stage = stage;
    newState.songId = songId;
  }

}