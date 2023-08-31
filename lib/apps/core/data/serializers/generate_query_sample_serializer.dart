


import 'package:vega/apps/core/data/models/generate_query_sample.dart';
import 'package:vega/lib/serializers/serializer.dart';

class GenerateQuerySampleSerializer extends Serializer<GenerateQuerySample, Map<String, dynamic>>{
  @override
  GenerateQuerySample deserialize(Map<String, dynamic> data) {
    return GenerateQuerySample(
        title: data["title"],
        coverImage: data["cover_image"],
        era: data["era"],
        genre: data["genre"],
        instruments: data["instruments"],
        lyricsType: data["lyrics"],
        mood: data["mood"]
    );
  }

  @override
  Map<String, dynamic> serialize(GenerateQuerySample instance) {
    // TODO: implement serialize
    throw UnimplementedError();
  }

}