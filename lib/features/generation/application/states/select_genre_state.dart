

import 'package:vega/common/async_bloc/base_state.dart';

class SelectGenreState extends BaseState{

  List<String>? genres;

  @override
  BaseState newInstance() {
    return SelectGenreState();
  }

  @override
  void copyProperties(BaseState newState) {
    super.copyProperties(newState);
    (newState as SelectGenreState).genres = genres;
  }

}