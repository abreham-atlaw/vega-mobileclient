import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/apps/generation/application/blocs/generate_bloc.dart';
import 'package:vega/apps/generation/application/events/generate_events.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/lib/widgets/containers/percentage_container.dart';
import 'package:vega/lib/widgets/text/body.dart';
import 'package:vega/lib/widgets/text/headers.dart';



class GenerateTopNavBar extends StatelessWidget{

  final String leftText;
  final void Function(BuildContext context) leftOnClick;

  final String rightText;
  final void Function(BuildContext context) rightOnClick;

  final String title;

  const GenerateTopNavBar({
    this.leftText = "BACK",
    this.leftOnClick = defaultLeftOnClick,
    this.rightText = "SKIP",
    this.rightOnClick = defaultRightOnClick,
    required this.title,
    super.key
  });

  static void defaultLeftOnClick(BuildContext context){
    context.read<GenerateBloc>().add(BackEvent());
  }

  static void defaultRightOnClick(BuildContext context){
    context.read<GenerateBloc>().add(SkipEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: SpacingConfigs.spacing5,
          horizontal: SpacingConfigs.spacing3,
        ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceBetween,
        children: <Widget>[
          PercentageContainer(
            width: 0.2,
            child: GestureDetector(
              onTap: (){
                leftOnClick(context);
              },
              child: BodyText(leftText),
            ),
          ),

          Heading2(title),

          PercentageContainer(
            width: 0.2,
            child: GestureDetector(
              onTap: (){
                rightOnClick(context);
              },
              child: BodyText(rightText, textAlign: TextAlign.end,),
            ),
          )

        ],
      ),
    );
  }

}


class Choice{
  final String choice;
  final bool isSelected;

  Choice(this.choice, {this.isSelected = false});
}

class ChoiceInstanceWidget extends StatelessWidget{

  final Choice choice;

  const ChoiceInstanceWidget({super.key,
    required this.choice,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: choice.isSelected ? ColorsConfigs.white : ColorsConfigs.primary,
          width: 4,
        ),
        color: choice.isSelected ? ColorsConfigs.primary : ColorsConfigs.white,
      ),
      child: Center(
        child: BodyText(
          choice.choice,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w700,
          color: choice.isSelected ? ColorsConfigs.white : ColorsConfigs.dark,
        ),
      ),
    );

  }
}

class ChoiceListWidget extends StatelessWidget {
  final List<Choice> choices;
  final Function(Choice) onSelected;

  const ChoiceListWidget({
    Key? key,
    required this.choices,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: choices
          .map(
            (choice) => PercentageContainer(
              width: 0.333,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SizedBox(
                    height: constraints.maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.all(SpacingConfigs.spacing3),
                      child: GestureDetector(
                        onTap: () {
                          onSelected(choice);
                        },
                        child: ChoiceInstanceWidget(
                          choice: choice,
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
      )
          .toList(),
    );
  }
}