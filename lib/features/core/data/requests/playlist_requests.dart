import 'package:vega/common/network/request.dart';
import 'package:vega/features/core/data/models/playlist.dart';
import 'package:vega/features/core/data/serializers/playlist_serializer.dart';

class GetAllPlaylistsRequest extends Request<List<Playlist>>{

  final PlaylistSerializer _serializer = PlaylistSerializer();

  GetAllPlaylistsRequest(): super(
    "core/playlist/all",
  );

  @override
  List<Playlist> deserializeObject(response) {
    return _serializer.deserializeMany(response);
  }

}


class GetPlaylistRequest extends Request<Playlist>{

  final PlaylistSerializer _serializer = PlaylistSerializer();

  GetPlaylistRequest(String id): super(
    "core/playlist/detail/",
    getParams: {
      "id": id
    }
  );

  @override
  Playlist deserializeObject(response) {
    return _serializer.deserialize(response);
  }

}

