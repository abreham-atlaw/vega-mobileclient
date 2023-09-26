


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/lib/utils/routing.dart';
import 'package:vega/lib/widgets/buttons/circular_icon_button.dart';
import 'package:vega/lib/widgets/text/body.dart';


class NavBarIcon extends StatelessWidget{

  final IconData icon;
  final String text;
  final String url;

  const NavBarIcon({
    required this.icon,
    required this.text,
    required this.url,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        RoutingUtils.redirect(url, context);
      },
      child: Column(
        children: [
          Icon(
            icon,
            size: FontSizeConfigs.size3,
            color: ColorsConfigs.light,
          ),
          BodyText(text)
        ],
      ),
    );
  }

}

class BottomNavBar extends StatelessWidget{
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: SpacingConfigs.spacing1,
        horizontal: SpacingConfigs.spacing6
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NavBarIcon(icon: Icons.home_outlined, text: "Home", url: "/core/home"),
          CircularIconButton(
            onPressed: (){
              RoutingUtils.redirect("/generation/generate", context);
            },
            icon: Icons.add,
          ),
          const NavBarIcon(icon: Icons.queue_music_outlined, text: "Library", url: "/core/library")
        ],
      ),
    );
  }

}