import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vega/configs/ui_configs.dart';

class AppScreen extends StatelessWidget {
  final Widget child;
  final SystemUiOverlayStyle systemUiOverlayStyle;

  const AppScreen({
    required this.child,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    super.key
  }):
        systemUiOverlayStyle = systemUiOverlayStyle ?? SystemUiOverlaysConfigs.overlayDark
  ;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorsConfigs.dark,
        appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            systemOverlayStyle: systemUiOverlayStyle
        ),
        body: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
