


import 'package:vega/features/generation/data/models/generate_query.dart';

class GenerateQuerySample extends GenerateQuery{

  String id;
  String title;
  String coverImage;

  GenerateQuerySample({
    required this.id,
    required this.title,
    required this.coverImage,
    required super.era,
    required super.genre,
    required super.instruments,
    required super.lyricsType,
    required super.mood
  });

}