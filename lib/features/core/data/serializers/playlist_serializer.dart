


import 'package:vega/common/serializers/serializer.dart';
import 'package:vega/features/core/data/models/playlist.dart';
import 'package:vega/features/core/data/serializers/song_serializer.dart';

class PlaylistSerializer extends Serializer<Playlist, dynamic>{

  final SongSerializer _songSerializer = SongSerializer();

  @override
  Playlist deserialize(data) {
    return Playlist(
        id: "${data["id"]}",
        title: data["title"],
        cover: data["cover"],
        songs: _songSerializer.deserializeMany(data["songs"])
    );
  }

  @override
  serialize(Playlist instance) {
    throw UnimplementedError();
  }


}