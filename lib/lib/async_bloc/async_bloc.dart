import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/lib/async_bloc/async_events.dart';
import 'package:vega/lib/async_bloc/async_handler.dart';
import 'package:vega/lib/async_bloc/async_state.dart';
import 'package:vega/lib/async_bloc/async_status.dart';
import 'package:vega/lib/async_bloc/base_state.dart';
import 'package:vega/lib/async_bloc/error_mapper.dart';

class FunctionalAsyncHandler extends AsyncEventHandler<AsyncEvent, BaseState> {
  Future<void> Function(AsyncEvent event, BaseState state) onEventCallback;
  AsyncState Function(BaseState)? stateGetter;
  Future<void> Function(AsyncEvent event, BaseState state, dynamic error)?
      onErrorCallback;
  Future<void> Function(AsyncEvent event, BaseState state)? onLoadingCallback;
  Future<void> Function(AsyncEvent event, BaseState state)? onDoneCallback;

  FunctionalAsyncHandler(this.onEventCallback, super._parentBloc,
      {this.stateGetter,
      this.onErrorCallback,
      this.onLoadingCallback,
      this.onDoneCallback});

  @override
  onEvent(AsyncEvent event, BaseState state) async {
    await onEventCallback(event, state);
  }

  @override
  onLoading(AsyncEvent event, BaseState state) async {
    await super.onLoading(event, state);
    if (onLoadingCallback != null) {
      await onLoadingCallback!(event, state);
    }
  }

  @override
  onDone(AsyncEvent event, BaseState state) async {
    await super.onDone(event, state);
    if (onDoneCallback != null) {
      await onDoneCallback!(event, state);
    }
  }

  @override
  onError(AsyncEvent event, BaseState state, error) async {
    await super.onError(event, state, error);
    if (onErrorCallback != null) {
      await onErrorCallback!(event, state, error);
    }
  }

  @override
  AsyncState getAsyncState(BaseState state) {
    if (stateGetter == null) {
      return super.getAsyncState(state);
    }
    return stateGetter!(state);
  }
}

class AsyncBloc<S extends BaseState> extends Bloc<AsyncEvent, S> {

  final ErrorMapper _errorMapper;

  AsyncBloc(super.initialState, {ErrorMapper? initErrorMapper}):
  _errorMapper = initErrorMapper ?? ErrorMapper(){
    on<InitializeEvent>(initialize);
  }

  Future<void> onInit() async {}

  Future<void> asyncCall(AsyncEvent event, Emitter emitter,
      Future<void> Function(AsyncEvent event, BaseState state) onEvent,
      {AsyncState Function(BaseState)? stateGetter,
      Future<void> Function(AsyncEvent event, BaseState state, dynamic error)?
          onError,
      Future<void> Function(AsyncEvent event, BaseState state)? onLoading,
      Future<void> Function(AsyncEvent event, BaseState state)? onDone}) async {
    var handler = FunctionalAsyncHandler(onEvent, this,
        stateGetter: stateGetter,
        onDoneCallback: onDone,
        onLoadingCallback: onLoading,
        onErrorCallback: onError);
    await handler.handle(event, emitter);
  }

  Future<void> initialize(InitializeEvent event, Emitter emitter) async {
    state.initStatus = AsyncStatus.loading;
    emitter.call(state.copy());
    try {
      await onInit();
      state.initStatus = AsyncStatus.done;
      emitter.call(state.copy());
    } catch (ex) {
      state.initStatus = AsyncStatus.failed;
      state.initError = _errorMapper.map(ex);
      emitter.call(state.copy());
    }
  }

  void syncState(Emitter emitter) {
    emitter.call(state.copy());
  }
}
