


import 'package:vega/features/generation/data/models/generate_query.dart';
import 'package:vega/features/generation/data/models/generation_status_response.dart';
import 'package:vega/features/core/data/models/song.dart';
import 'package:vega/features/generation/data/serializers/generate_query_serializer.dart';
import 'package:vega/features/core/data/serializers/song_serializer.dart';
import 'package:vega/features/generation/data/serializers/status_response_serializer.dart';
import 'package:vega/common/network/request.dart';

class GetRecentRequest extends Request<List<Song>>{
  final SongSerializer _serializer = SongSerializer();

  GetRecentRequest(): super(
    "core/song/recent/",
    method: Method.get
  );

  @override
  List<Song> deserializeObject(response) {
    return _serializer.deserializeMany(response);
  }
}

class GenerateRequest extends Request<String>{

  final GenerateQuerySerializer _serializer = GenerateQuerySerializer();
  final GenerateQuery _query;

  GenerateRequest(this._query): super(
    "core/song/generate/",
    method: Method.post
  );

  @override
  Map<String, dynamic> getPostData() {
    return _serializer.serialize(_query);
  }

  @override
  String deserializeObject(response) {
    return response["request_id"];
  }

}


class GetGenerationStatusRequest extends Request<StatusResponse>{

  final StatusResponseSerializer _serializer = StatusResponseSerializer();

  GetGenerationStatusRequest(String generationId): super(
    "core/song/status/",
    method: Method.get,
    getParams: {
      "id": generationId
    }
  );

  @override
  StatusResponse deserializeObject(response) {
    return _serializer.deserialize(response);
  }

}


class GetSongRequest extends Request<Song>{
  final SongSerializer _serializer = SongSerializer();

  GetSongRequest(String id): super(
    "core/song/detail/",
    method: Method.get,
    getParams: {
      "id": id
    }
  );

  @override
  Song deserializeObject(response) {
    return _serializer.deserialize(response);
  }
}