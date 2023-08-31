import 'package:flutter/material.dart';
import 'package:vega/configs/ui_configs.dart';

class BaseButton extends ElevatedButton {
  BaseButton(
      {super.key,
      super.onPressed,
      super.child,
      EdgeInsets? padding,
      Color? textColor,
      BorderSide? borderSide,
      Color? backgroundColor})
      : super(
            style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? ColorsConfigs.primary,
                padding: padding ??
                    const EdgeInsets.symmetric(
                        vertical: SpacingConfigs.spacing1,
                        horizontal: SpacingConfigs.spacing5),
                shape: RoundedRectangleBorder(
                  side: borderSide ?? BorderSide.none,
                    borderRadius:
                        BorderRadius.circular(SpacingConfigs.spacing3))));
}
