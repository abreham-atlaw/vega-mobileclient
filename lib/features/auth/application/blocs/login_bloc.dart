import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/features/auth/application/events/login_event.dart';
import 'package:vega/features/auth/application/states/login_state.dart';
import 'package:vega/features/auth/data/repositories/auth_repository.dart';
import 'package:vega/common/async_bloc/async_bloc.dart';
import 'package:vega/common/async_bloc/async_error.dart';
import 'package:vega/common/async_bloc/error_mapper.dart';
import 'package:vega/common/network/network_client.dart';


class LoginBloc extends AsyncBloc<LoginState> {

  final AuthRepository _authRepository = AuthRepository();

  LoginBloc(super.initialState) {
    on<LoginEvent>(_handleLogin);
  }

  Future<void> _handleLogin(LoginEvent event, Emitter emitter) async{
    await asyncCall(
      event,
      emitter,
      (_, __) async {
        await state.form.isValid(throwError: true);
        await _authRepository.login(state.form.username.getValue()!, state.form.password.getValue()!);
      },
      errorMapper: ErrorMapper(
        mapper: (dynamic error) {
          if (error is ApiException && error.statusCode == 401) {
            return AsyncError("Incorrect Username or Password");
          }
        }
      )
    );
  }
}
