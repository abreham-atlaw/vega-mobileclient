
import 'package:vega/lib/forms/field.dart';
import 'package:vega/lib/forms/form.dart';

class LoginForm extends Form {
  Field<String> username = TextField();
  Field<String> password = TextField();

  @override
  List<Field> getFields() {
    return [username, password];
  }
}
