import 'package:equatable/equatable.dart';

class AsyncEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitializeEvent extends AsyncEvent {
  @override
  List<Object?> get props => ["lib.bloc.async_events.AsyncEvent"];
}
