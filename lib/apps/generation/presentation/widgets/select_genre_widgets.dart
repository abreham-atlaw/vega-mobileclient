import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/lib/widgets/text/body.dart';

class GenreChoiceWidget extends StatelessWidget{

  static const String defaultAssetFile = "assets/images/genres/default.png";

  final String genre;
  final void Function() onClick;

  const GenreChoiceWidget(this.genre, this.onClick, {super.key});

  String get _assetFile{
    String fileName = "assets/images/genres/${genre.replaceAll(" ", "_").toLowerCase()}.png";
    try{
      rootBundle.loadString(fileName);
      return fileName;
    }
    catch(_){
      return defaultAssetFile;
    }

  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(SpacingConfigs.spacing0_5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(SpacingConfigs.spacing1)),
          image: DecorationImage(
            image: AssetImage(
                _assetFile
            )
          )
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: BodyText(
            genre,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

  }

}