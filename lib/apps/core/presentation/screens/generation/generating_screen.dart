


import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/apps/core/application/blocs/generate_bloc.dart';
import 'package:vega/apps/core/application/blocs/generating_bloc.dart';
import 'package:vega/apps/core/application/events/generate_events.dart';
import 'package:vega/apps/core/application/states/generating_state.dart';
import 'package:vega/apps/core/data/models/generate_query.dart';
import 'package:vega/apps/core/data/models/generation_status_response.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/lib/widgets/buttons/base_button.dart';
import 'package:vega/lib/widgets/containers/full_container.dart';
import 'package:vega/lib/widgets/containers/percentage_container.dart';
import 'package:vega/lib/widgets/containers/width_height_container.dart';
import 'package:vega/lib/widgets/screens/bloc_screen.dart';
import 'package:vega/lib/widgets/text/headers.dart';

class GeneratingScreen extends AsyncBlocScreen<GeneratingBloc, GeneratingState>{

  static const Map<GenerationStatus, String> _statusHeadings = {
    GenerationStatus.none: "Initializing",
    GenerationStatus.instrumental: "Creating Instrumental",
    GenerationStatus.lyrics: "Writing Lyrics",
    GenerationStatus.vocal: "Laying Vocals",
    GenerationStatus.mix: "Mixing Track"
  };

  final GenerateQuery query;

  const GeneratingScreen(this.query, {super.key});

  @override
  GeneratingBloc onCreateBloc(GeneratingState state) {
    return GeneratingBloc(state);
  }

  @override
  Widget onCreateMain(BuildContext context, GeneratingState state) {
    return FullContainer(
      alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/stars_background.png")
            )
        ),
        child: PercentageContainer(
            width: 0.75,
            child: Column(
              children: [
                const SizedBox(
                  height: SpacingConfigs.spacing6,
                ),
                Heading2(
                    (state.response!.status == GenerationStatus.done) ?
                        "TRACK GENERATED" :
                        "GENERATING"
                ),
                const SizedBox(
                  height: SpacingConfigs.spacing6,
                ),
                WidthSizedHeightContainer(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SpacingConfigs.spacing4)
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: (state.response!.status == GenerationStatus.done) ?
                        Image.network(state.song!.coverImageUrl) :
                        Image.asset("assets/images/status/${state.response!.status.name}.png"),
                  ),
                ),
                const SizedBox(
                  height: SpacingConfigs.spacing5,
                ),
                Heading3(
                    (state.response!.status == GenerationStatus.done) ?
                        state.song!.title :
                        "${_statusHeadings[state.response!.status]!}..."
                ),
                const SizedBox(
                  height: SpacingConfigs.spacing7,
                ),

                (state.response!.status == GenerationStatus.done) ?
                BaseButton(
                  padding: const EdgeInsets.all(SpacingConfigs.spacing3),
                  borderRadius: BorderRadius.circular(SpacingConfigs.spacing5),
                    onPressed: (){
                      context.read<GenerateBloc>().add(PlayEvent(state.response!.songId!));
                    },
                    child: const Icon(Icons.play_arrow, color: ColorsConfigs.light, size: FontSizeConfigs.size3,)
                ):
                const SizedBox(
                      width: WidgetSizeConfigs.size0,
                      child: LoadingIndicatorsConfigs.indicatorLight
                )
              ],
            )));
  }

  @override
  GeneratingState onCreateState() {
    return GeneratingState(query);
  }

}