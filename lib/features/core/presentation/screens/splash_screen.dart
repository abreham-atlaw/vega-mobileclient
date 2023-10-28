import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vega/features/auth/data/models/authentication_status.dart';
import 'package:vega/common/widgets/screens/authenticated_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return AuthenticatedScreen(
        validStatuses: const [],
        redirectMap: const {
          AuthenticationStatus.authenticated: "/core/home",
          AuthenticationStatus.notVerified: "/core/home",
          AuthenticationStatus.none: "/auth/login"
        },
        child: const SizedBox.shrink()
    );
  }

}
