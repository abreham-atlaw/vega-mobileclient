import 'package:vega/features/generation/data/models/generate_query_sample.dart';
import 'package:vega/common/serializers/serializer.dart';

class GenerateQuerySampleSerializer extends Serializer<GenerateQuerySample, Map<String, dynamic>>{
  @override
  GenerateQuerySample deserialize(Map<String, dynamic> data) {
    return GenerateQuerySample(
        id: data["id"],
        title: data["title"],
        coverImage: data["cover"],
        era: data["era"],
        genre: data["genre"],
        instruments: data["instruments"].map<String>((dynamic item) => item as String).toList(),
        lyricsType: data["lyrics"].map<String>((dynamic item) => item as String).toList(),
        mood: data["mood"]
    );
  }

  @override
  Map<String, dynamic> serialize(GenerateQuerySample instance) {
    // TODO: implement serialize
    throw UnimplementedError();
  }

}