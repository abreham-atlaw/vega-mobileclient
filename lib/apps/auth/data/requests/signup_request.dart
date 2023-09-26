import 'package:vega/apps/auth/data/models/user.dart';
import 'package:vega/lib/network/request.dart';
import 'package:vega/apps/auth/data/serializers/user_serializer.dart';

class SignupRequest extends Request<User> {
  final UserSerializer _serializer = UserSerializer();

  SignupRequest(String username, String fullName, String password)
      : super("/auth/signup/",
            postParams: {
              "username": username,
              "full_name": fullName,
              "password": password,
            },
            method: Method.post
  );

  @override
  User deserializeObject(response) {
    return _serializer.deserialize(response);
  }
}


class UserExistsRequest extends Request<bool>{
  
  UserExistsRequest(String phoneNumber): 
      super(
        "/auth/user-exists/",
        method: Method.get,
        getParams: {
          "email": phoneNumber
        }
      );

  @override
  bool deserializeObject(response) {
    return response["exists"];
  }
  
}