


import 'package:flutter/widgets.dart';
import 'package:vega/configs/ui_configs.dart';

import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  final VoidCallback onPressed;

  const CircularIconButton({
    Key? key,
    required this.icon,
    this.size = WidgetSizeConfigs.size0_5,
    this.color = ColorsConfigs.primary,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const CircleBorder(),
          ),
        ),
        child: Icon(
          icon,
          color: ColorsConfigs.light,
          size: size * 0.5,
        ),
      ),
    );
  }
}