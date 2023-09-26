

import 'package:vega/apps/generation/data/models/generate_query_sample.dart';
import 'package:vega/apps/generation/data/serializers/generate_query_sample_serializer.dart';
import 'package:vega/lib/network/request.dart';

class GetRecommendationsRequest extends Request<List<GenerateQuerySample>>{

  final GenerateQuerySampleSerializer _serializer = GenerateQuerySampleSerializer();

  GetRecommendationsRequest(): super(
    "core/recommend/",
    method: Method.get
  );

  @override
  List<GenerateQuerySample> deserializeObject(response) {
    return _serializer.deserializeMany(response);
  }

}


class GetPopularRequest extends Request<List<GenerateQuerySample>>{

  final GenerateQuerySampleSerializer _serializer = GenerateQuerySampleSerializer();
  GetPopularRequest(): super(
    "core/recents/",
    method: Method.get
  );

  @override
  List<GenerateQuerySample> deserializeObject(response) {
    return _serializer.deserializeMany(response);
  }

}