import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/features/auth/application/blocs/login_bloc.dart';
import 'package:vega/features/auth/application/events/login_event.dart';
import 'package:vega/features/auth/application/states/login_state.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/common/async_bloc/async_status.dart';
import 'package:vega/common/utils/routing.dart';
import 'package:vega/common/widgets/buttons/async_button.dart';
import 'package:vega/common/widgets/containers/full_container.dart';
import 'package:vega/common/widgets/containers/percentage_container.dart';
import 'package:vega/common/widgets/forms/labeled_field.dart';
import 'package:vega/common/widgets/forms/text_field_widget.dart';
import 'package:vega/common/widgets/navigation/link.dart';
import 'package:vega/common/widgets/screens/bloc_screen.dart';
import 'package:vega/common/widgets/text/body.dart';
import 'package:vega/common/widgets/text/errors.dart';
import 'package:vega/common/widgets/text/headers.dart';

class LoginScreen extends AsyncBlocScreen<LoginBloc, LoginState> {
  const LoginScreen({super.key});

  @override
  LoginBloc onCreateBloc(LoginState state) {
    return LoginBloc(state);
  }

  @override
  Widget onCreateMain(BuildContext context, LoginState state) {
    if (state.asyncStatus == AsyncStatus.done) {
      RoutingUtils.redirect("/", context);
    }
    return FullContainer(
      alignment: Alignment.center,
      child: PercentageContainer(
        width: 0.8,
        child: Column(
          children: [
            Heading2("WELCOME BACK"),
            const SizedBox(height: SpacingConfigs.spacing3,),
            BodyText("Log in to continue your musical journey"),
            const SizedBox(
              height: SpacingConfigs.spacing3,
            ),
            ErrorText(state.error?.message ?? ""),
            const SizedBox(
              height: SpacingConfigs.spacing4,
            ),
            LabeledFormField(
              label: "Email",
              inputField: TextFieldWidget(
                field: state.form.username,
                iconData: Icons.email,
              ),
            ),
            const SizedBox(
              height: SpacingConfigs.spacing5,
            ),
            LabeledFormField(
              label: "Password",
              inputField: TextFieldWidget(
                field: state.form.password,
                iconData: Icons.lock,
                obsecureText: true,
              ),
            ),
            const SizedBox(
              height: SpacingConfigs.spacing5,
            ),
            AsyncButton(
              onPressed: () => {context.read<LoginBloc>().add(LoginEvent())},
              state: state,
              child: BodyText("LOGIN", color: ColorsConfigs.white),
            ),
            const SizedBox(
              height: SpacingConfigs.spacing3,
            ),
            Align(
              alignment: Alignment.center,
              child: Wrap(
                children: [
                  BodyText("Don't have an account?"),
                  Link(
                    to: "/auth/signup",
                    child: BodyText(
                      "Sign up",
                      color: ColorsConfigs.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  LoginState onCreateState() {
    return LoginState();
  }
}
