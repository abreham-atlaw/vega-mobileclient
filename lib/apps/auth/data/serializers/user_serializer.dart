import 'package:vega/apps/auth/data/models/user.dart';
import 'package:vega/lib/serializers/serializer.dart';

class UserSerializer extends Serializer<User, Map<String, dynamic>> {
  @override
  User deserialize(Map<String, dynamic> data) {
    return User(fullName: data["full_name"], username: data["email"], isVerified: data["is_verified"]);
  }

  @override
  Map<String, dynamic> serialize(User instance) {
    return {
      "username": instance.username,
      "full_name": instance.fullName,
      "is_verified": instance.isVerified
    };
  }
}
