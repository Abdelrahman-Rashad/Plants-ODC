enum HTTPMethods { get, post, delete, put, patch }

extension HTTPMethodsString on HTTPMethods {
  String get string {
    switch (this) {
      case HTTPMethods.get:
        return "get";

      case HTTPMethods.post:
        return "post";
        
      case HTTPMethods.delete:
        return "delete";

      case HTTPMethods.put:
        return "put";

      case HTTPMethods.patch:
        return "patch";
    }
  }
}

abstract class APIStructure {
  String get url;
  String get endpoint;
  String get path;
  HTTPMethods get method;
  Map<String,String>? get headers;
  Map<String,String>? get query;
  dynamic get body;
  Future request();
}
