


import 'package:vega/apps/core/application/states/home_state.dart';
import 'package:vega/apps/core/data/models/song.dart';
import 'package:vega/lib/async_bloc/async_bloc.dart';

class HomeBloc extends AsyncBloc<HomeState>{

  HomeBloc(super.initialState);

  @override
  Future<void> onInit() async{
    await super.onInit();
    state.recent = [];
    state.populars = [];
    state.recommendations = [];
  }

}