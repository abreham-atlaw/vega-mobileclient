import 'package:flutter/material.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/lib/forms/field.dart';

abstract class FieldWidget<T> extends StatefulWidget {
  final Field<T> field;
  final Function? onChanged;

  const FieldWidget({
    Key? key,
    required this.field,
    this.onChanged,
  }) : super(key: key);

  Widget constructInputNode(T? value, Function(T) callback);

  Widget constructErrorTextNode(T? value, String? error) {
    return Text('$error', style: const TextStyle(color: ColorsConfigs.danger));
  }

  String generateID([String prefix = 'ID']) {
    return '$prefix-${DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  _FieldWidgetState<T> createState() => _FieldWidgetState<T>();
}

class _FieldWidgetState<T> extends State<FieldWidget<T>> {
  late Field<T> _field;

  @override
  void initState() {
    super.initState();
    _field = widget.field;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.constructInputNode(_field.getValue(), _onChange),
        if (_field.error != null)
          widget.constructErrorTextNode(_field.getValue(), _field.error),
      ],
    );
  }

  Future<void> _onChange(T value) async {
    setState(() {
      _field = widget.field;
    });
    await _field.setValue(value);
    setState(() {
      _field = widget.field;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
    setState(() {
      _field = widget.field;
    });
  }
}
