import 'package:flutter/material.dart';
import 'package:vega/dependency_injection/core.dart';
import 'package:vega/router.dart';

void main() async{
  await CoreProviders.provideAudioHandler();
  runApp(const VegaApp());
}

class VegaApp extends StatelessWidget {
  const VegaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = VegaAppRouter();
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
