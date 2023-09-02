


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/apps/core/application/blocs/generate_bloc.dart';
import 'package:vega/apps/core/application/events/generate_events.dart';
import 'package:vega/apps/core/presentation/screens/generation/base_select_screen.dart';
import 'package:vega/apps/core/presentation/widgets/generate_widgets.dart';

class SelectEraScreen extends StatelessWidget{

  const SelectEraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseSelectScreen(
        title: "Time Era",
        choices: ["80s", "90s", "2000s", "Modern"].map<Choice>(
                (choice) => Choice(choice)
        ).toList(),
        onSelected: (Choice choice) {
          context.read<GenerateBloc>().add(SelectEraEvent(choice.choice));
        }
    );
  }
}