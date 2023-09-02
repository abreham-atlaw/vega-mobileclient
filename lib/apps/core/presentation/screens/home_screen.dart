


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vega/apps/core/application/blocs/home_bloc.dart';
import 'package:vega/apps/core/application/states/home_state.dart';
import 'package:vega/apps/core/presentation/widgets/bottom_nav_bar.dart';
import 'package:vega/lib/widgets/screens/bloc_screen.dart';

class HomeScreen extends AsyncBlocScreen<HomeBloc, HomeState>{
  const HomeScreen({super.key});

  @override
  HomeBloc onCreateBloc(HomeState state) {
    return HomeBloc(state);
  }

  @override
  Widget onCreateMain(BuildContext context, HomeState state) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [

                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomNavBar(),
        ),
      ],
    );
  }

  @override
  HomeState onCreateState() {
    return HomeState();
  }

}