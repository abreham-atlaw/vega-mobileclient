import 'dart:developer';

abstract class RepositoryCall<I, O> {
  void storeCache(O value);

  Future<O?> getCached(I input);

  Future<O> networkCall(I input);

  Future<O> get(I input, [getcached = true, cache = true]) async {
    O? cached;

    try {
      O? cached = await getCached(input);
    } catch (e) {
      log("Failed to Fetch from cache $e");
    }

    if (getcached && cached != null) {
      log("Returing Cached Value");
      return cached;
    }

    log("Not Found in Cache");
    O value = await networkCall(input);

    if (cache) {
      log("Storing to Cache");
      try {
        storeCache(value);
      } catch (e) {
        log("Error Storing Cache $e");
      }
    }

    log("Returning Network Value");
    return value;
  }
}
