


import 'package:vega/apps/core/data/models/generation_status_response.dart';
import 'package:vega/lib/serializers/serializer.dart';

class StatusResponseSerializer extends Serializer<StatusResponse, Map<String, dynamic>>{
  @override
  StatusResponse deserialize(Map<String, dynamic> data) {
    return StatusResponse(
        GenerationStatus.values[data["status"]],
        data["song"]
    );
  }

  @override
  Map<String, dynamic> serialize(StatusResponse instance) {
    throw UnimplementedError();
  }

}