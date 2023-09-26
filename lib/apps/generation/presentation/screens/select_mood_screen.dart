


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/apps/generation/application/blocs/generate_bloc.dart';
import 'package:vega/apps/generation/application/events/generate_events.dart';
import 'package:vega/apps/generation/presentation/screens/base_select_screen.dart';
import 'package:vega/apps/generation/presentation/widgets/generate_widgets.dart';

class SelectMoodScreen extends StatelessWidget{
  const SelectMoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseSelectScreen(
      title: "Mood",
      choices: ["Happy", "Sad", "Energetic", "Chill", "Intense"].map<Choice>(
              (choice) => Choice(choice)
      ).toList(),
      onSelected: (Choice choice) {
        context.read<GenerateBloc>().add(SelectMoodEvent(choice.choice));
      },

    );
  }
  
  
  
}