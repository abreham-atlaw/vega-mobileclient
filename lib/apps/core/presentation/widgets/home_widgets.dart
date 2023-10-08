


import 'package:flutter/widgets.dart';
import 'package:vega/apps/generation/data/models/generate_query_sample.dart';
import 'package:vega/apps/core/data/models/song.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/lib/widgets/containers/width_height_container.dart';
import 'package:vega/lib/widgets/navigation/link.dart';
import 'package:vega/lib/widgets/text/body.dart';
import 'package:vega/lib/widgets/text/headers.dart';

class SongInstanceWidget extends StatelessWidget{
  
  final Song _song;
  
  const SongInstanceWidget(this._song, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Link(
      to: "/player/play",
      extra: _song.id,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidthSizedHeightContainer(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(SpacingConfigs.spacing3)),
                  image: DecorationImage(
                    image: NetworkImage(_song.coverImageUrl)
                  )
                ),
              ),
            ),
            const SizedBox(
              height: SpacingConfigs.spacing1,
            ),
            BodyText(
              _song.title,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
      ),
    );
  }
  
}


class RecommendationWidget extends StatelessWidget{

  final GenerateQuerySample _recommendation;

  const RecommendationWidget(this._recommendation, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(SpacingConfigs.spacing4),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(SpacingConfigs.spacing3)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            _recommendation.coverImage
          )
        )
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Heading4(_recommendation.title),
      ),
    );
  }

}


class PopularQueryWidget extends StatelessWidget{

  final GenerateQuerySample _query;

  const PopularQueryWidget(this._query, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(SpacingConfigs.spacing4),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(SpacingConfigs.spacing3)),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  _query.coverImage
              )
          )
      ),
      child: Align(
        alignment: Alignment.center,
        child: Heading4(_query.title),
      ),
    );
  }

}