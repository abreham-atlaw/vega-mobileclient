import 'package:vega/apps/auth/data/models/authentication_status.dart';
import 'package:vega/apps/auth/data/models/user.dart';
import 'package:vega/apps/auth/data/requests/login_request.dart';
import 'package:vega/apps/auth/data/requests/signup_request.dart';
import 'package:vega/apps/auth/data/requests/whoami_request.dart';
import 'package:vega/di/auth.dart';
import 'package:vega/di/core.dart';
import 'package:vega/lib/network/network_client.dart';
import 'package:vega/lib/utils/token_storage.dart';

class AuthRepository {
  final TokenStorage _tokenStorage = AuthProviders.provideTokenStorage();
  final NetworkClient _networkClient = CoreProviders.provideNetworkClient();

  Future<NetworkClient> get _authenticatedNetworkClient async {
    return await CoreProviders.provideAuthenticatedNetworkClient();
  }

  Future<void> authenticate(String token) async {
    await _tokenStorage.storeToken(token);
  }

  Future<void> login(String username, String password) async {
    await logout();
    await authenticate(
        await _networkClient.execute(LoginRequest(username, password)));
  }

  Future<void> signup(String username, String fullName, String password) async {
    await _networkClient.execute(SignupRequest(username, fullName, password));
    await login(username, password);
  }

  Future<bool> userExists(String phoneNumber) async{
    return await _networkClient.execute(UserExistsRequest(phoneNumber));
  }

  Future<void> logout() async {
    await _tokenStorage.revokeToken();
    AuthProviders.reset();
    CoreProviders.reset();
  }

  Future<AuthenticationStatus> _isAuthenticatedLocally() async {
    if (await _tokenStorage.getToken() != null) {
      return AuthenticationStatus.authenticated;
    }
    return AuthenticationStatus.none;
  }

  Future<User> whoAmI() async{
    return await ( await _authenticatedNetworkClient).execute(WhoAmIRequest());
  }

  Future<AuthenticationStatus> getAuthenticationStatus() async {
    try {
      if (await _tokenStorage.getToken() == null) {
        return AuthenticationStatus.none;
      }
      User me = await whoAmI();
      if (me.isVerified) {
        return AuthenticationStatus.authenticated;
      }
      return AuthenticationStatus.notVerified;
    } catch (ex) {
      if (ex is ApiException){
        switch(ex.statusCode){
          case 401:
            return AuthenticationStatus.none;
          case 426:
            return AuthenticationStatus.requiresUpdate;
        }

      }
      return await _isAuthenticatedLocally();
    }
  }

}
