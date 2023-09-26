


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/apps/generation/application/blocs/generate_bloc.dart';
import 'package:vega/apps/generation/application/events/generate_events.dart';
import 'package:vega/apps/generation/presentation/screens/base_select_screen.dart';

class SelectInstrumentsScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return SelectMultipleChoicesScreen(
        title: "Instruments",
        choices: const ["Piano", "Guitar", "Violin", "Drums", "Saxophone", "Trumpet", "Flute", "Cello"],
      onSubmit: (List<String> choices){
          context.read<GenerateBloc>().add(SelectInstrumentsEvent(choices));
      },
    );
  }

}