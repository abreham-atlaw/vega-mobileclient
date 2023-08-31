import 'exceptions.dart';
import 'field.dart';

abstract class Form {
  List<Field<dynamic>> getFields();
  String? error;

  Future<void> validate() async {
    var valid = true;
    for (final field in getFields()) {
      if (!(await field.isValid())) {
        valid = false;
      }
    }
    if (!valid) {
      throw ValidationException('Error in form fields');
    }
  }

  Future<bool> isValid({bool throwError = false}) async {
    try {
      await validate();
      return true;
    } catch (ex) {
      if (ex is! ValidationException) {
        rethrow;
      }
      error = ex.message;
      if (throwError) {
        rethrow;
      }
      return false;
    }
  }
}
