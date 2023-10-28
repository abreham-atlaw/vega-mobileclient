


import 'package:vega/features/player/application/blocs/player_bloc.dart';
import 'package:vega/features/player/application/states/player_state.dart';

class PlayerProviders{

  static PlayerBloc? _playerBloc;

  static PlayerBloc providePlayerBloc(){
    _playerBloc ??= PlayerBloc(PlayerState());
    return _playerBloc!;
  }

}