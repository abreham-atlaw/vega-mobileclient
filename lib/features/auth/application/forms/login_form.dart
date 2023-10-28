
import 'package:vega/common/forms/field.dart';
import 'package:vega/common/forms/form.dart';

class LoginForm extends Form {
  Field<String> username = TextField();
  Field<String> password = TextField();

  @override
  List<Field> getFields() {
    return [username, password];
  }
}
