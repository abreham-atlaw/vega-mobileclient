

import 'package:vega/apps/auth/data/repositories/auth_repository.dart';
import 'package:vega/lib/utils/token_storage.dart';

class AuthProviders {
  static AuthRepository? _authRepository;

  static TokenStorage provideTokenStorage() {
    return FlutterSecureStorageTokenStorage();
  }

  static AuthRepository provideAuthRepository() {
    AuthProviders._authRepository ??= AuthRepository();
    return AuthProviders._authRepository!;
  }

  static void reset() {
    AuthProviders._authRepository = null;
  }
}
