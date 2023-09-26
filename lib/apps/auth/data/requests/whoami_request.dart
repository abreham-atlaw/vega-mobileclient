
import 'package:vega/apps/auth/data/models/user.dart';
import 'package:vega/apps/auth/data/serializers/user_serializer.dart';
import 'package:vega/lib/network/request.dart';

class WhoAmIRequest extends Request<User> {
  final UserSerializer _serializer = UserSerializer();

  WhoAmIRequest() : super("/user/me/", method: Method.get);

  @override
  User deserializeObject(response) {
    return _serializer.deserialize(response);
  }
}
