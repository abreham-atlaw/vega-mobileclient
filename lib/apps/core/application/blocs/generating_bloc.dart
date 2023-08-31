


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/apps/core/application/events/generating_events.dart';
import 'package:vega/apps/core/application/states/generating_state.dart';
import 'package:vega/apps/core/data/repositories/song_repository.dart';
import 'package:vega/di/core.dart';
import 'package:vega/lib/async_bloc/async_bloc.dart';

class GeneratingBloc extends AsyncBloc<GeneratingState>{

  final SongRepository _songRepository = SongRepository();

  GeneratingBloc(super.initialState){
    on<RefreshEvent>(_handleRefresh);
  }

  @override
  Future<void> onInit() async{
    await super.onInit();
    state.requestId = await _songRepository.generate(state.query);
  }

  Future<void> _handleRefresh(RefreshEvent event, Emitter emitter) async{
    state.response = await _songRepository.getStatus(state.requestId!);
    syncState(emitter);
  }

}