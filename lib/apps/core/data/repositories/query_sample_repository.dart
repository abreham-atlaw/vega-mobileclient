


import 'package:vega/apps/core/data/models/generate_query_sample.dart';
import 'package:vega/apps/core/data/models/song.dart';
import 'package:vega/apps/core/data/requests/query_sample_requests.dart';
import 'package:vega/apps/core/data/requests/song_requests.dart';
import 'package:vega/di/core.dart';
import 'package:vega/lib/network/network_client.dart';

class GenerateQuerySampleRepository{

  final NetworkClient _networkClient = CoreProviders.provideNetworkClient();

  Future<List<GenerateQuerySample>> getRecommendations() async{
    return await _networkClient.execute(GetRecommendationsRequest());
  }

}