import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/apps/auth/application/events/signup_event.dart';
import 'package:vega/apps/auth/application/states/signup_state.dart';
import 'package:vega/apps/auth/data/repositories/auth_repository.dart';
import 'package:vega/lib/async_bloc/async_bloc.dart';

class SignupBloc extends AsyncBloc<SignupState> {

  final AuthRepository _authRepository = AuthRepository();

  SignupBloc(super.initialState) {
    on<SignupEvent>(_handleSignup);
  }

  Future<void> _handleSignup(SignupEvent event, Emitter emitter) async{
    await asyncCall(event, emitter, (_, __) async {
      await state.form.isValid(throwError: true);
      await _authRepository.signup(
          state.form.email.getValue()!,
          state.form.fullName.getValue()!,
          state.form.password.getValue()!
      );
    });
  }

}
