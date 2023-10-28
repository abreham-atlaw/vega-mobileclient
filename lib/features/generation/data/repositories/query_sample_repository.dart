


import 'package:vega/features/generation/data/models/generate_query_sample.dart';
import 'package:vega/features/core/data/requests/query_sample_requests.dart';
import 'package:vega/dependency_injection/core.dart';
import 'package:vega/common/network/network_client.dart';

class GenerationRepository{

  final Future<NetworkClient> _networkClient = CoreProviders.provideAuthenticatedNetworkClient();

  Future<List<GenerateQuerySample>> getRecommendations() async{
    return await (await _networkClient).execute(GetRecommendationsRequest());
  }

}