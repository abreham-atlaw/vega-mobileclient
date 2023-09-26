
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/apps/auth/data/models/authentication_status.dart';
import 'package:vega/apps/auth/data/repositories/auth_repository.dart';
import 'package:vega/lib/async_bloc/async_bloc.dart';
import 'package:vega/lib/async_bloc/async_events.dart';
import 'package:vega/lib/async_bloc/async_state.dart';
import 'package:vega/lib/async_bloc/async_status.dart';
import 'package:vega/lib/async_bloc/base_state.dart';
import 'package:vega/lib/utils/routing.dart';
import 'package:vega/lib/widgets/screens/error_screen.dart';
import 'package:vega/lib/widgets/screens/loading_screen.dart';

class AuthenticationState extends AsyncState {
  AuthenticationStatus authenticationStatus = AuthenticationStatus.none;

  @override
  BaseState newInstance() {
    return AuthenticationState();
  }

  @override
  void copyProperties(BaseState newState) {
    super.copyProperties(newState);
    (newState as AuthenticationState).authenticationStatus =
        authenticationStatus;
  }
}

class AuthenticationBloc extends AsyncBloc<AuthenticationState> {
  final AuthRepository _repository = AuthRepository();

  AuthenticationBloc(super.initialState);

  @override
  onInit() async {
    await super.onInit();
    state.authenticationStatus = await _repository.getAuthenticationStatus();
  }
}

class AuthenticatedScreen extends StatelessWidget {
  final Widget child;
  final Widget? loadingScreen;
  final Widget? failedScreen;
  final String redirectTo;
  final Map<AuthenticationStatus, String> redirectMap;
  final List<AuthenticationStatus> validStatuses;

  AuthenticatedScreen(
      {super.key,
      required this.child,
      this.redirectTo = "/auth/review/",
      this.loadingScreen,
      this.failedScreen,
      Map<AuthenticationStatus, String>? redirectMap,
      List<AuthenticationStatus>? validStatuses})
      : redirectMap = {
          AuthenticationStatus.none: "/auth/login",
          AuthenticationStatus.requiresUpdate: "/auth/update-required"
        },
        validStatuses = validStatuses ?? [AuthenticationStatus.authenticated, AuthenticationStatus.notVerified]{
      this.redirectMap.addAll(redirectMap??{});
    }

  bool _isValidStatus(AuthenticationStatus status) {
    return (validStatuses.contains(status));
  }

  String _getRedirectPath(AuthenticationStatus status) {
    var mapValue = redirectMap[status];
    return mapValue ?? redirectTo;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider<AuthenticationBloc>(
        create: (BuildContext context) =>
            AuthenticationBloc(AuthenticationState()),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (BuildContext context, AuthenticationState state) {
          switch (state.initStatus) {
            case AsyncStatus.none:
              context.read<AuthenticationBloc>().add(InitializeEvent());
              return loadingScreen ?? LoadingScreen(state);
            case AsyncStatus.loading:
              return loadingScreen ?? LoadingScreen(state);
            case AsyncStatus.done:
              if (_isValidStatus(state.authenticationStatus)) {
                return child;
              } else {
                RoutingUtils.redirect(
                    _getRedirectPath(state.authenticationStatus), context);
                return const SizedBox.shrink();
              }
            case AsyncStatus.failed:
              return failedScreen ?? ErrorScreen(state);
          }
        }),
      ),
    );
  }
}
