import 'package:vega/apps/auth/application/forms/signup_form.dart';
import 'package:vega/lib/async_bloc/async_state.dart';
import 'package:vega/lib/async_bloc/base_state.dart';


class SignupState extends AsyncState {
  SignupForm form = SignupForm();

  @override
  BaseState newInstance() {
    return SignupState();
  }

  @override
  void copyProperties(BaseState newState) {
    super.copyProperties(newState);
    (newState as SignupState).form = form;
  }
}
