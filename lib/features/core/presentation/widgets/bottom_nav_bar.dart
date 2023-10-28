


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/common/utils/routing.dart';
import 'package:vega/common/widgets/buttons/circular_icon_button.dart';
import 'package:vega/common/widgets/text/body.dart';


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
            size: FontSizeConfigs.size2,
            color: ColorsConfigs.light,
          ),
          const SizedBox(height: SpacingConfigs.spacing1,),
          BodyText(
              text,
              fontSize: FontSizeConfigs.size0,
          )
        ],
      ),
    );
  }

}

class BottomNavBar extends StatelessWidget{
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsConfigs.dark,
        border: Border(
          top: BorderSide(
            color: ColorsConfigs.grey,
            width: 1
          )
        )
      ),
      padding: const EdgeInsets.symmetric(
        vertical: SpacingConfigs.spacing2,
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
            size: WidgetSizeConfigs.size0,
            icon: Icons.add,
          ),
          const NavBarIcon(icon: Icons.queue_music_outlined, text: "Library", url: "/core/library")
        ],
      ),
    );
  }

}