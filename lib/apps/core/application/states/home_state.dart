


import 'package:vega/apps/generation/data/models/generate_query_sample.dart';
import 'package:vega/apps/core/data/models/song.dart';
import 'package:vega/lib/async_bloc/base_state.dart';

class HomeState extends BaseState{

  List<GenerateQuerySample>? recommendations;
  List<Song>? recent;
  List<GenerateQuerySample>? populars;

  @override
  BaseState newInstance() {
    return HomeState();
  }

  @override
  void copyProperties(BaseState newState) {
    super.copyProperties(newState);
    (newState as HomeState).recommendations = recommendations;
    newState.populars = populars;
    newState.recent = recent;
  }

}

