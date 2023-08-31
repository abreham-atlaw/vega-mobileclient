import 'package:vega/lib/async_bloc/base_state.dart';

import 'async_error.dart';
import 'async_status.dart';

class AsyncState extends BaseState {
  AsyncStatus asyncStatus;
  AsyncError? error;

  AsyncState({this.asyncStatus = AsyncStatus.none, this.error});

  @override
  BaseState newInstance() {
    return AsyncState();
  }

  @override
  void copyProperties(BaseState newState) {
    super.copyProperties(newState);
    (newState as AsyncState).asyncStatus = asyncStatus;
    newState.error = error;
  }
}
