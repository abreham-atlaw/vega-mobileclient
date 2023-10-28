


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/common/async_bloc/async_bloc.dart';
import 'package:vega/features/core/application/events/library_events.dart';
import 'package:vega/features/core/application/states/library_state.dart';
import 'package:vega/features/core/data/repositories/library_repository.dart';



class LibraryBloc extends AsyncBloc<LibraryState>{

  final LibraryRepository _repository = LibraryRepository();

  LibraryBloc(super.initialState){
    on<SwitchPageEvent>(_handleSwitchPage);
  }

  @override
  Future<void> onInit() async{
    await super.onInit();
    state.recent = await _repository.getRecent();
    state.playlists = await _repository.getAllPlaylists();
  }

  _handleSwitchPage(SwitchPageEvent event, Emitter emitter) async{
    state.page = event.page;
    syncState(emitter);
  }

}