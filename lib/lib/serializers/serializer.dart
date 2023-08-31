abstract class Serializer<F, T> {
  T serialize(F instance);
  F deserialize(T data);

  List<T> serializeMany(List<F> instances) {
    if (instances.isEmpty) {
      return [];
    }
    return instances.map((instance) => serialize(instance)).toList();
  }

  List<F> deserializeMany(List<dynamic> data) {
    return data.map((e) => deserialize(e)).toList();
  }
}
