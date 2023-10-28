


import 'package:vega/features/core/data/models/song.dart';
import 'package:vega/common/serializers/serializer.dart';

class SongSerializer extends Serializer<Song, Map<String, dynamic>>{
  @override
  Song deserialize(Map<String, dynamic> data) {
    return Song(
      id: data["id"],
      coverImageUrl: data["cover"],
      audioUrl: data["audio"],
      lyrics: data["lyrics"],
      title: data["title"],
      duration: Duration(seconds: data["duration"].toInt())
    );
  }

  @override
  Map<String, dynamic> serialize(Song instance) {
    throw UnimplementedError();
  }

}