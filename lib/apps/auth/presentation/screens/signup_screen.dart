import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/apps/auth/application/blocs/signup_bloc.dart';
import 'package:vega/apps/auth/application/events/signup_event.dart';
import 'package:vega/apps/auth/application/states/signup_state.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/lib/async_bloc/async_status.dart';
import 'package:vega/lib/utils/routing.dart';
import 'package:vega/lib/widgets/buttons/async_button.dart';
import 'package:vega/lib/widgets/containers/percentage_container.dart';
import 'package:vega/lib/widgets/forms/labeled_field.dart';
import 'package:vega/lib/widgets/forms/text_field_widget.dart';
import 'package:vega/lib/widgets/navigation/link.dart';
import 'package:vega/lib/widgets/screens/bloc_screen.dart';
import 'package:vega/lib/widgets/text/body.dart';
import 'package:vega/lib/widgets/text/errors.dart';
import 'package:vega/lib/widgets/text/headers.dart';

class SignupScreen extends AsyncBlocScreen<SignupBloc, SignupState> {

  const SignupScreen({super.key});

  @override
  SignupBloc onCreateBloc(SignupState state) {
    return SignupBloc(state);
  }

  @override
  Widget onCreateMain(BuildContext context, SignupState state) {
    if (state.asyncStatus == AsyncStatus.done) {
      RoutingUtils.redirect("/", context);
    }
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: SpacingConfigs.spacing6),
        alignment: Alignment.center,
        child: PercentageContainer(
          width: 0.8,
          child: Column(
            children: [
              Heading2("GET STARTED"),
              const SizedBox(
                height: SpacingConfigs.spacing3,
              ),
              BodyText(
                "Unlock your creativity and personalize your musical experience",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: SpacingConfigs.spacing3,
              ),
              ErrorText(state.error?.message ?? ""),
              const SizedBox(
                height: SpacingConfigs.spacing2,
              ),
              LabeledFormField(
                label: "Full Name",
                inputField: TextFieldWidget(
                  field: state.form.fullName,
                  iconData: Icons.person,
                ),
              ),
              const SizedBox(
                height: SpacingConfigs.spacing5,
              ),
              LabeledFormField(
                label: "Email",
                inputField: TextFieldWidget(
                  field: state.form.email,
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
              LabeledFormField(
                label: "Confirm Password",
                inputField: TextFieldWidget(
                  field: state.form.confirmPassword,
                  iconData: Icons.lock,
                  obsecureText: true,
                ),
              ),
              const SizedBox(
                height: SpacingConfigs.spacing6,
              ),
              AsyncButton(
                onPressed: () =>
                    {context.read<SignupBloc>().add(SignupEvent())},
                state: state,
                child: BodyText("SIGN UP", color: ColorsConfigs.white),
              ),
              const SizedBox(
                height: SpacingConfigs.spacing3,
              ),
              Align(
                alignment: Alignment.center,
                child: Wrap(
                  children: [
                    BodyText("Already have an account?"),
                    Link(
                      to: "/auth/login",
                      child: BodyText(
                        "Login",
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
      ),
    );
  }

  @override
  SignupState onCreateState() {
    return SignupState();
  }
}
