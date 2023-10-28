import 'dart:core';
import 'package:intl/intl.dart';

import 'package:vega/common/serializers/serializer.dart';

class DateTimeSerializer extends Serializer<DateTime, String> {
  final _formatter = DateFormat("yyyy-MM-dd HH:mm:ss");

  @override
  DateTime deserialize(String data) {
    return _formatter.parseUTC(data);
  }

  @override
  String serialize(DateTime instance) {
    return _formatter.format(instance.toUtc());
  }
}
