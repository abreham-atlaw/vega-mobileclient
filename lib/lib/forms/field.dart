import 'package:vega/lib/forms/exceptions.dart';

class Field<T> {
  T? value;
  String? error;
  bool required;
  Function? validator;
  bool liveValidate;

  Field({
    this.required = true,
    this.validator,
    this.liveValidate = true,
  });

  Future<bool> isValid() async {
    this.error = null;
    try {
      await validate();
      return true;
    } catch (ex) {
      if (ex is! ValidationException) {
        rethrow;
      }
      this.error = (ex as ValidationException).message;
      return false;
    }
  }

  Future<void> validate() async {
    if (required && getValue() == null) {
      throw ValidationException('This field is required');
    }
    if (validator != null) {
      await validator!(getValue());
    }
  }

  T? getValue() {
    return value;
  }

  Future<void> setValue(T? value) async {
    this.value = value;
    if (liveValidate) {
      await isValid();
    }
  }
}

class TextField extends Field<String> {
  bool emptyAsNull;

  TextField({
    required = true,
    validator,
    liveValidate = true,
    this.emptyAsNull = true,
  }) : super(
            required: required,
            validator: validator,
            liveValidate: liveValidate);

  @override
  String? getValue() {
    final value = super.getValue();
    if (emptyAsNull && value == '') {
      return null;
    }
    return value;
  }
}

class ListField<T> extends Field<List<T?>> {
  Function? generator;
  List<Field<T>> fields = [];

  ListField({
    this.generator,
    required = true,
    validator,
    liveValidate = true,
  }) : super(
            required: required,
            validator: validator,
            liveValidate: liveValidate) {
    generator ??= () => Field<T>();
  }

  Field<T> add() {
    final field = generator!() as Field<T>;
    fields.add(field);
    return field;
  }

  Field<T> pop([int? i]) {
    i ??= fields.length - 1;
    final field = fields[i];
    fields.removeAt(i);
    return field;
  }

  @override
  List<T?>? getValue() {
    return fields.map((field) => field.getValue()).toList();
  }

  @override
  Future<void> setValue(List<T?>? values) async {
    fields = [];
    if (values == null) {
      return;
    }
    for (final value in values) {
      final field = add();
      await field.setValue(value);
    }
  }

  List<Field<T>> getFields() {
    return fields;
  }

  @override
  Future<String?> validate() async {
    String? validationError;
    for (var i = 0; i < fields.length; i++) {
      final field = fields[i];
      if (await field.isValid()) {
        continue;
      }
      validationError ??= '';
      validationError += '\n$i. ${field.error}';
    }
    return validationError;
  }
}

// class PrimaryKeyField<T> extends Field<T> {
//   Repository<T, Model<T>> repository;

//   PrimaryKeyField(
//     this.repository, {
//     required = true,
//     validator,
//     liveValidate = true,
//   }) : super(
//             required: required,
//             validator: validator,
//             liveValidate: liveValidate);

//   @override
//   Future<String?> validate() async {
//     final error = await super.validate();
//     if (error != null) {
//       return error;
//     }
//     if (getValue() == null && !required) {
//       return null;
//     }
//     try {
//       await repository.getByPrimaryKey(getValue()!);
//       return null;
//     } on InstanceNotFoundException {
//       return 'Not Found';
//     }
//   }
// }
