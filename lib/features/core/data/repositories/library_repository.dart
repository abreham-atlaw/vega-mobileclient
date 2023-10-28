


import 'package:vega/features/core/data/models/playlist.dart';
import 'package:vega/features/core/data/requests/playlist_requests.dart';
import 'package:vega/features/generation/data/models/generate_query.dart';
import 'package:vega/features/generation/data/models/generation_status_response.dart';
import 'package:vega/features/core/data/models/song.dart';
import 'package:vega/features/core/data/requests/song_requests.dart';
import 'package:vega/dependency_injection/core.dart';
import 'package:vega/common/network/network_client.dart';

class LibraryRepository{

  final NetworkClient _networkClient = CoreProviders.provideNetworkClient();

  Future<NetworkClient> get _authenticatedNetworkClient async {
    return await CoreProviders.provideAuthenticatedNetworkClient();
  }

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
    return await (await _authenticatedNetworkClient).execute(GenerateRequest(query));
  }

  Future<StatusResponse> getStatus(String requestId) async{
    return await (await _authenticatedNetworkClient).execute(GetGenerationStatusRequest(requestId));
  }

  Future<List<Playlist>> getAllPlaylists() async{
    return await (await _authenticatedNetworkClient).execute(GetAllPlaylistsRequest());
  }

  Future<Playlist> getPlaylist(String id) async{
    return await (await _authenticatedNetworkClient).execute(GetPlaylistRequest(id));
  }

}