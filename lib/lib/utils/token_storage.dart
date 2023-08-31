import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String tokenKey = "JOB_APP.AUTH_TOKEN";

abstract class TokenStorage {
  Future<String?> getToken();

  Future<void> storeToken(String token);

  Future<void> revokeToken();
}

class FlutterSecureStorageTokenStorage extends TokenStorage {
  final _storage = const FlutterSecureStorage();

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: tokenKey);
  }

  @override
  Future<void> storeToken(String token) async {
    await _storage.write(key: tokenKey, value: token);
  }

  @override
  Future<void> revokeToken() async {
    await _storage.delete(key: tokenKey);
  }
}
