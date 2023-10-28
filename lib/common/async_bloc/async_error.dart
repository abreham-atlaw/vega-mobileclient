class AsyncError implements Exception {
  String message;
  int? code;
  AsyncError(this.message, {this.code});
}
