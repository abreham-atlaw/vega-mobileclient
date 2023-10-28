import 'package:vega/common/network/request.dart';

class LoginRequest extends Request<String> {
  LoginRequest(String username, String password)
      : super("/auth/login/",
            postParams: {"username": username, "password": password},
            method: Method.post);

  @override
  String deserializeObject(response) {
    return response["token"]!;
  }
}
