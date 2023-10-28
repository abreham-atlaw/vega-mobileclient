enum Method { get, post, patch, delete }

abstract class Request<T> {
  final String _url;
  Method _method = Method.get;
  Map<String, dynamic> _getParams = {};
  Map<String, dynamic> _postParams = {};
  Map<String, String> _headers = {};

  Request(this._url, {getParams, postParams, headers, method}) {
    if (getParams != null) {
      _getParams = getParams;
    }
    if (postParams != null) {
      _postParams = postParams;
    }
    if (headers != null) {
      _headers = headers;
    }
    if (method != null) {
      _method = method;
    }
  }

  String getUrl() {
    return _url;
  }

  Map<String, dynamic> getGetParams() {
    return _getParams;
  }

  Map<String, dynamic> getPostData() {
    return _postParams;
  }

  Map<String, String> getHeaders() {
    return _headers;
  }

  Method getMethod() {
    return _method;
  }

  T deserializeObject(dynamic response);
}
