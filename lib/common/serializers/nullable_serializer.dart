import 'package:vega/common/serializers/serializer.dart';

class NullableSerializer<F, T> extends Serializer<F?, T?> {
  Serializer<F, T> serializer;

  NullableSerializer(this.serializer);

  @override
  F? deserialize(T? data) {
    if (data == null) {
      return null;
    }
    return serializer.deserialize(data);
  }

  @override
  T? serialize(F? instance) {
    if (instance == null) {
      return null;
    }
    return serializer.serialize(instance);
  }
}
