import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/apps/core/application/blocs/generate_bloc.dart';
import 'package:vega/apps/core/application/blocs/select_genre_bloc.dart';
import 'package:vega/apps/core/application/events/generate_events.dart';
import 'package:vega/apps/core/application/states/select_genre_state.dart';
import 'package:vega/apps/core/presentation/widgets/generate_widgets.dart';
import 'package:vega/apps/core/presentation/widgets/select_genre_widgets.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/lib/widgets/containers/percentage_container.dart';
import 'package:vega/lib/widgets/screens/bloc_screen.dart';


class SelectGenreScreen extends AsyncBlocScreen<SelectGenreBloc, SelectGenreState>{
  const SelectGenreScreen({super.key});

  @override
  SelectGenreBloc onCreateBloc(SelectGenreState state) {
    return SelectGenreBloc(state);
  }

  @override
  Widget onCreateMain(BuildContext context, SelectGenreState state) {
    return Container(
      child: Column(
        children: [
          const GenerateTopNavBar(
            title: 'Select Genre'
          ),
          Container(
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: state.genres!.map<Widget>(
                      (String genre) => PercentageContainer(
                        width: 0.33,
                        child: LayoutBuilder(
                          builder:(BuildContext context, BoxConstraints constraints){

                            return Container(
                              padding: const EdgeInsets.all(SpacingConfigs.spacing0_5),
                              height: constraints.maxWidth,
                              child: GenreChoiceWidget(
                                  genre,
                                      (){
                                    context.read<GenerateBloc>().add(SelectGenreEvent(genre));
                                  }
                              ),
                            );
                          },
                        ),
                      )
              ).toList(),
            ),
          )

        ],
      ),
    );
  }

  @override
  SelectGenreState onCreateState() {
    return SelectGenreState();
  }

}