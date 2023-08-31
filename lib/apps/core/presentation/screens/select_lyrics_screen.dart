

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/apps/core/application/blocs/generate_bloc.dart';
import 'package:vega/apps/core/application/events/generate_events.dart';
import 'package:vega/apps/core/presentation/screens/base_select_screen.dart';

class SelectLyricsScreen extends StatelessWidget{
  const SelectLyricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectMultipleChoicesScreen(
        title: "Lyrics",
        choices: const [
          "Personal", "Love", "Story-Telling", "Emotive", "Reflective", "Party",
          "Playful", "Descriptive", "Poetic"
        ],
        onSubmit: (List<String> choices){
          context.read<GenerateBloc>().add(SelectLyricsTypeEvent(choices));
        }
    );

  }

}