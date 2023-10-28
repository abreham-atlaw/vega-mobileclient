


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vega/features/core/presentation/widgets/bottom_nav_bar.dart';
import 'package:vega/features/player/presentation/widgets/bottom_player_bar.dart';

class BaseScreen extends StatelessWidget{
  
  final Widget _child;
  
  const BaseScreen(this._child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _child),
          const BottomPlayerBar(),
          const BottomNavBar()
        ],
      ),
    );
  }

}