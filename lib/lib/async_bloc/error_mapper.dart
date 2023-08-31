


import 'dart:io';

import 'package:vega/lib/async_bloc/async_error.dart';
import 'package:vega/lib/forms/exceptions.dart';
import 'package:vega/lib/network/network_client.dart';

class ErrorMapper{

  AsyncError? Function(dynamic error)? mapper;
  AsyncError? Function(dynamic error)? defaultMapper;

  ErrorMapper({this.mapper, this.defaultMapper});

  AsyncError map(dynamic error){

    if(mapper != null){
      var asyncError = mapper!(error);
      if(asyncError != null){
        return asyncError;
      }
    }
    if (error is AsyncError) {
      return error;
    }
    if (error is ApiException) {
      switch(error.statusCode){
        case 400:
          return AsyncError("Error in input. Please check your input.", code: error.statusCode);
        case 500:
          return AsyncError("Unknown server has occurred. Please try again or try later.", code: error.statusCode);
        default:
          return AsyncError("We're sorry, but something went wrong. Please contact customer support for assistance.", code: error.statusCode);
      }
    }
    if (error is ValidationException){
      return AsyncError("Invalid input. Please check your input.");
    }
    if(error is SocketException){
      return AsyncError("Unable to connect to the server. Please check your internet connection and try again.");
    }

    if(defaultMapper != null){
      var asyncError = defaultMapper!(error);
      if(asyncError != null){
        return asyncError;
      }
    }
    return AsyncError("We're sorry, but something went wrong. Please contact customer support for assistance.");
  }

}