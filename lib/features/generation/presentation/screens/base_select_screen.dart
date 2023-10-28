import 'package:flutter/cupertino.dart';
import 'package:vega/features/generation/presentation/widgets/generate_widgets.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/common/widgets/buttons/base_button.dart';
import 'package:vega/common/widgets/text/body.dart';

class BaseSelectScreen extends StatelessWidget{

  final String title;
  final List<Choice> choices;
  final void Function(Choice choice) onSelected;
  final void Function()? onSubmit;

  const BaseSelectScreen(
      {
        required this.title,
        required this.choices,
        required this.onSelected,
        this.onSubmit,
        super.key
      }
   );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/genres/hip-hop.png"),
              fit: BoxFit.cover
          )
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(100, 0, 0, 0)
        ),
        child: Column(
          children: [
            GenerateTopNavBar(title: title),
            const SizedBox(
              height: SpacingConfigs.spacing4,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: SpacingConfigs.spacing5,
                  horizontal: SpacingConfigs.spacing3
              ),
              child: ChoiceListWidget(
                  choices: choices,
                  onSelected: onSelected
              ),
            ),
            Visibility(
                visible: onSubmit != null,
                child: BaseButton(
                  onPressed: onSubmit ?? (){

                  },
                  borderSide: const BorderSide(
                    color: ColorsConfigs.white,
                    width: 2
                  ),
                  backgroundColor: ColorsConfigs.primary,
                  child: BodyText("NEXT"),
                )
            )
          ],
        ),
      ),
    );
  }

}



class SelectMultipleChoicesScreen extends StatefulWidget {
  final String title;
  final List<String> choices;

  final void Function(List<String> choices) onSubmit;

  const SelectMultipleChoicesScreen({required this.title, required this.choices, required this.onSubmit, super.key});

  @override
  _SelectMultipleChoicesScreenState createState() => _SelectMultipleChoicesScreenState();
}

class _SelectMultipleChoicesScreenState extends State<SelectMultipleChoicesScreen> {
  final List<String> _selectedChoices = [];

  @override
  Widget build(BuildContext context) {
    return BaseSelectScreen(
      title: widget.title,
      choices: widget.choices.map<Choice>(
            (choice) => Choice(
          choice,
          isSelected: _selectedChoices.contains(choice),
        ),
      ).toList(),
      onSubmit: (){
        widget.onSubmit(_selectedChoices);
      },
      onSelected: (Choice choice) {
        setState(() {
          if (_selectedChoices.contains(choice.choice)) {
            _selectedChoices.remove(choice.choice);
          } else {
            _selectedChoices.add(choice.choice);
          }
        });
      },
    );
  }
}