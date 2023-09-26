import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vega/apps/auth/data/models/authentication_status.dart';
import 'package:vega/lib/widgets/screens/authenticated_screen.dart';
import 'package:vega/lib/widgets/screens/bloc_screen.dart';

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
