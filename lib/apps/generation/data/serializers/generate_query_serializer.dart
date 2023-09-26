


import 'package:vega/apps/generation/data/models/generate_query.dart';
import 'package:vega/lib/serializers/serializer.dart';

class GenerateQuerySerializer extends Serializer<GenerateQuery, Map<String, dynamic>>{
  @override
  GenerateQuery deserialize(Map<String, dynamic> data) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> serialize(GenerateQuery instance) {
    return {
      "genre": instance.genre,
      "era": instance.era,
      "mood": instance.mood,
      "lyrics": instance.lyricsType,
      "instruments": instance.instruments
    };
  }
  
  
}