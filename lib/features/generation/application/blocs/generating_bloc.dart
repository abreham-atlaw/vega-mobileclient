import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/features/generation/application/events/generating_events.dart';
import 'package:vega/features/generation/application/states/generating_state.dart';
import 'package:vega/features/generation/data/models/generation_status_response.dart';
import 'package:vega/features/core/data/repositories/library_repository.dart';
import 'package:vega/common/async_bloc/async_bloc.dart';

class GeneratingBloc extends AsyncBloc<GeneratingState>{

  final LibraryRepository _songRepository = LibraryRepository();
  late Timer _timer;

  GeneratingBloc(super.initialState){
    on<RefreshEvent>(_handleRefresh);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(RefreshEvent());
    });

  }

  @override
  Future<void> onInit() async{
    await super.onInit();
    state.requestId = await _songRepository.generate(state.query);
    state.response = await _songRepository.getStatus(state.requestId!);
  }

  Future<void> _handleRefresh(RefreshEvent event, Emitter emitter) async{
    state.response = await _songRepository.getStatus(state.requestId!);
    if(state.response!.status == GenerationStatus.done){
      state.song = await _songRepository.getSong(state.response!.songId!);
    }
    syncState(emitter);
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }

}