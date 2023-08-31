import 'package:flutter/material.dart';
import 'package:vega/configs/ui_configs.dart';

class LabeledFormField extends StatelessWidget {
  Widget inputField;
  String label;
  TextStyle labelStyle;

  LabeledFormField(
      {required this.inputField,
      required this.label,
      TextStyle? labelStyle,
      super.key})
      : labelStyle = labelStyle ??
            TextStyle(
                color: ColorsConfigs.dark,
                fontSize: FontSizeConfigs.size1,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle,
        ),
        SizedBox(height: SpacingConfigs.spacing0),
        inputField
      ],
    );
  }
}
