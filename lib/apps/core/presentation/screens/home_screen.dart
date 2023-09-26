


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vega/apps/core/application/blocs/home_bloc.dart';
import 'package:vega/apps/core/application/states/home_state.dart';
import 'package:vega/apps/core/presentation/widgets/bottom_nav_bar.dart';
import 'package:vega/apps/core/presentation/widgets/home_widgets.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/lib/widgets/containers/percentage_container.dart';
import 'package:vega/lib/widgets/containers/width_height_container.dart';
import 'package:vega/lib/widgets/screens/bloc_screen.dart';
import 'package:vega/lib/widgets/text/headers.dart';

class HomeScreen extends AsyncBlocScreen<HomeBloc, HomeState>{
  const HomeScreen({super.key});

  @override
  HomeBloc onCreateBloc(HomeState state) {
    return HomeBloc(state);
  }

  @override
  Widget onCreateMain(BuildContext context, HomeState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingConfigs.spacing3
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: SpacingConfigs.spacing4
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: WidgetSizeConfigs.size0,
                          ),
                          Heading3("VEGA"),
                          IconButton(
                              onPressed: (){

                              },
                              icon: const Icon(
                                Icons.settings_outlined,
                                color: ColorsConfigs.light,
                              )
                          ),

                        ],
                      ),
                    ),

                    SizedBox(
                      height: WidgetSizeConfigs.size3,
                      child: RecommendationWidget(
                          state.recommendations![0]
                      ),
                    ),

                    const SizedBox(
                      height: SpacingConfigs.spacing4,
                    ),

                    Heading4("Recent"),
                    const SizedBox(
                      height: SpacingConfigs.spacing3,
                    ),
                    SizedBox(
                      height: WidgetSizeConfigs.size3,
                      child: SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: state.recent!.sublist(0, 3).map(
                                  (song) =>
                                      PercentageContainer(
                                          width: 0.3,
                                          child: SongInstanceWidget(song)
                                      )
                          ).toList(),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: SpacingConfigs.spacing4,
                    ),

                    Heading4("Popular"),
                    const SizedBox(
                      height: SpacingConfigs.spacing3,
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: state.populars!.map(
                              (query) => WidthSizedHeightContainer(
                                  width: WidgetSizeConfigs.size4,
                                  child: Container(
                                      margin: const EdgeInsets.only(right: SpacingConfigs.spacing3),
                                      child: PopularQueryWidget(query)
                                  )
                              )
                          ).toList(),
                        ))
                  ],
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavBar(),
          ),
        ],
      ),
    );
  }

  @override
  HomeState onCreateState() {
    return HomeState();
  }

}