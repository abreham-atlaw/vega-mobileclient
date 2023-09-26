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
            const TextStyle(
                color: ColorsConfigs.white,
                fontSize: FontSizeConfigs.size1,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w200);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle,
        ),
        const SizedBox(height: SpacingConfigs.spacing1),
        inputField
      ],
    );
  }
}
