


import 'package:vega/apps/generation/data/models/generate_query.dart';

class GenerateQuerySample extends GenerateQuery{

  String title;
  String coverImage;

  GenerateQuerySample({
    required this.title,
    required this.coverImage,
    required super.era,
    required super.genre,
    required super.instruments,
    required super.lyricsType,
    required super.mood
  });

}