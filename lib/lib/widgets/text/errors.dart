import 'package:flutter/widgets.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/lib/async_bloc/async_error.dart';
import 'package:vega/lib/widgets/text/body.dart';

class ErrorText extends BodyText {
  ErrorText(super.text, {super.key}) : super(color: ColorsConfigs.danger);
}

class AsyncErrorText extends StatelessWidget{

  AsyncError _error;

  AsyncErrorText(this._error, {super.key});

  String _generateText(){
    switch(_error.code){

      case null:
        return _error.message;
      case 400:
        return _error.message;
      case 500:
        return "Server Error";
      default:
        return "Unknown error has occurred.";

    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }}
