import 'package:vega/features/generation/data/models/generate_query.dart';
import 'package:vega/features/generation/data/models/generation_status_response.dart';
import 'package:vega/features/core/data/models/song.dart';
import 'package:vega/common/async_bloc/base_state.dart';

class GeneratingState extends BaseState{

  StatusResponse? response;
  String? requestId;
  Song? song;

  GenerateQuery query;
  GeneratingState(this.query);

  @override
  BaseState newInstance() {
    return GeneratingState(query);
  }

  @override
  void copyProperties(BaseState newState) {
    super.copyProperties(newState);
    (newState as GeneratingState).query = query;
    newState.response = response;
    newState.requestId = requestId;
    newState.song = song;
  }

}