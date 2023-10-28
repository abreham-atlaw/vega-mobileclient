import 'package:flutter/widgets.dart';
import 'package:vega/features/core/data/models/playlist.dart';
import 'package:vega/features/generation/data/models/generate_query_sample.dart';
import 'package:vega/features/core/data/models/song.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/common/widgets/containers/width_height_container.dart';
import 'package:vega/common/widgets/navigation/link.dart';
import 'package:vega/common/widgets/text/body.dart';
import 'package:vega/common/widgets/text/headers.dart';

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
    return Link(
      to: '/generation/generate-query',
      extra: _recommendation,
      child: Container(
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


class PlaylistWidget extends StatelessWidget{

  final Playlist _playlist;

  const PlaylistWidget(this._playlist, {super.key});

  @override
  Widget build(BuildContext context) {
    return Link(
      to: "/core/playlist",
      extra: _playlist.id,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsConfigs.primaryDark,
          borderRadius: BorderRadius.circular(SpacingConfigs.spacing1)
        ),
        padding: const EdgeInsets.all(SpacingConfigs.spacing0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidthSizedHeightContainer(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(SpacingConfigs.spacing1)),
                    image: DecorationImage(
                        image: NetworkImage(_playlist.cover)
                    )
                ),
              ),
            ),
            const SizedBox(
              height: SpacingConfigs.spacing1,
            ),
            Padding(
              padding: const EdgeInsets.all(SpacingConfigs.spacing1),
              child: BodyText(
                _playlist.title,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }

}