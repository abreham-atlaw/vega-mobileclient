


import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/apps/core/application/blocs/generate_bloc.dart';
import 'package:vega/apps/core/application/blocs/generating_bloc.dart';
import 'package:vega/apps/core/application/events/generate_events.dart';
import 'package:vega/apps/core/application/states/generating_state.dart';
import 'package:vega/apps/core/data/models/generate_query.dart';
import 'package:vega/apps/core/data/models/generation_status_response.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/lib/widgets/containers/full_container.dart';
import 'package:vega/lib/widgets/containers/percentage_container.dart';
import 'package:vega/lib/widgets/screens/bloc_screen.dart';
import 'package:vega/lib/widgets/text/headers.dart';

class GeneratingScreen extends AsyncBlocScreen<GeneratingBloc, GeneratingState>{

  static const Map<GenerationStatus, String> _statusHeadings = {
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
    if(state.response!.status == GenerationStatus.done){
      context.read<GenerateBloc>().add(GeneratedEvent(state.response!.songId!));
      return const SizedBox.shrink();
    }
    return FullContainer(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/stars_background.png")
            )
        ),
        child: PercentageContainer(
            width: 0.75,
            child: Column(
              children: [
                Heading1("Generating"),
                Image.asset("assets/images/${state.response!.status.name}.png"),
                const SizedBox(
                  height: SpacingConfigs.spacing3,
                ),
                Heading2("${_statusHeadings[state.response!.status]!}..."),
                const SizedBox(
                  height: SpacingConfigs.spacing5,
                ),
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