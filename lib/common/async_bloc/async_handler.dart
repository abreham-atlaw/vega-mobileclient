import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/common/async_bloc/async_error.dart';
import 'package:vega/common/async_bloc/error_mapper.dart';
import 'package:meta/meta.dart';

import 'async_state.dart';
import 'async_status.dart';

abstract class AsyncEventHandler<E, S> {
  final Bloc _parentBloc;
  final ErrorMapper _errorMapper;

  AsyncEventHandler(this._parentBloc, {ErrorMapper? errorMapper}):
  _errorMapper = errorMapper ?? ErrorMapper();

  @protected
  onEvent(E event, S state);

  @protected
  onDone(E event, S state) async {
    getAsyncState(state).asyncStatus = AsyncStatus.done;
  }

  AsyncError parseError(dynamic error) {
    return _errorMapper.map(error);
  }

  @protected
  onError(E event, S state, dynamic error) async {
    getAsyncState(state).asyncStatus = AsyncStatus.failed;
    getAsyncState(state).error = parseError(error);
  }

  @protected
  onLoading(E event, S state) async {
    getAsyncState(state).asyncStatus = AsyncStatus.loading;
  }

  @protected
  S constructState(S oldState, AsyncState asyncState) {
    return asyncState as S;
  }

  @protected
  AsyncState getAsyncState(S state) {
    return state as AsyncState;
  }

  void syncState(Emitter emitter) {
    var newState = _parentBloc.state.copy();
    emitter.call(newState);
  }

  handle(E event, Emitter emitter) async {
    await onLoading(event, _parentBloc.state);
    syncState(emitter);
    try {
      await onEvent(event, _parentBloc.state);
      syncState(emitter);
      await onDone(event, _parentBloc.state);
      syncState(emitter);
    } catch (error) {
      await onError(event, _parentBloc.state, error);
      syncState(emitter);
    }
  }
}
