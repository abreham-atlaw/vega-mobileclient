


import 'package:vega/apps/generation/data/models/generate_query.dart';
import 'package:vega/apps/generation/data/models/generation_status_response.dart';
import 'package:vega/apps/core/data/models/song.dart';
import 'package:vega/apps/core/data/requests/song_requests.dart';
import 'package:vega/di/core.dart';
import 'package:vega/lib/network/network_client.dart';

class SongRepository{

  final NetworkClient _networkClient = CoreProviders.provideNetworkClient();

  Future<Song> getSong(String id) async{
    return await _networkClient.execute(GetSongRequest(id));
  }

  Future<List<Song>> getRecent() async{
    return await _networkClient.execute(GetRecentRequest());
  }

  Future<List<String>> getGenres() async{
    return [
      "Blues",
      "Country",
      "Electronic",
      "Hip-Hop",
      "Jazz",
      "Pop",
      "R & B",
      "Rock",
      "Metal",
      "Punk",
      "Afro Pop",
      "K Pop"
    ];
  }

  Future<String> generate(GenerateQuery query) async{
    return await _networkClient.execute(GenerateRequest(query));
  }

  Future<StatusResponse> getStatus(String requestId) async{
    return await _networkClient.execute(GetGenerationStatusRequest(requestId));
  }

}