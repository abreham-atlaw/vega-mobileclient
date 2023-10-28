


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vega/features/core/application/blocs/home_bloc.dart';
import 'package:vega/features/core/application/states/home_state.dart';
import 'package:vega/features/core/presentation/widgets/home_widgets.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/common/widgets/containers/percentage_container.dart';
import 'package:vega/common/widgets/screens/bloc_screen.dart';
import 'package:vega/common/widgets/text/headers.dart';

class HomeScreen extends AsyncBlocScreen<HomeBloc, HomeState>{
  const HomeScreen({super.key});

  @override
  HomeBloc onCreateBloc(HomeState state) {
    return HomeBloc(state);
  }

  @override
  Widget onCreateMain(BuildContext context, HomeState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: SpacingConfigs.spacing3),
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
              height: SpacingConfigs.spacing5,
            ),

            Heading4("Your Playlists"),
            const SizedBox(
              height: SpacingConfigs.spacing2,
            ),
            SizedBox(
              height: WidgetSizeConfigs.size3,
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  children: state.playlists!.sublist(0, min(3, state.playlists!.length)).map(
                          (playlist) =>
                          PercentageContainer(
                              width: 0.33,
                              child: Container(
                                  margin: const EdgeInsets.only(right: SpacingConfigs.spacing2),
                                  child: PlaylistWidget(playlist))
                          )
                  ).toList(),
                ),
              ),
            ),

            const SizedBox(
              height: SpacingConfigs.spacing5,
            ),

            Heading4("Jump Back In"),
            const SizedBox(
              height: SpacingConfigs.spacing2,
            ),
            SizedBox(
              height: WidgetSizeConfigs.size3,
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: state.recent!.sublist(0, min(3, state.recent!.length)).map(
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

            // Heading4("Popular"),
            // const SizedBox(
            //   height: SpacingConfigs.spacing3,
            // ),
            // SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: state.populars!.map(
            //           (query) => WidthSizedHeightContainer(
            //               width: WidgetSizeConfigs.size4,
            //               child: Container(
            //                   margin: const EdgeInsets.only(right: SpacingConfigs.spacing3),
            //                   child: PopularQueryWidget(query)
            //               )
            //           )
            //       ).toList(),
            //     ))
          ],
        ),
      ),
    );
  }

  @override
  HomeState onCreateState() {
    return HomeState();
  }

}