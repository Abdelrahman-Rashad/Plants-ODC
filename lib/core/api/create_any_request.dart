import 'package:get/get.dart';
import 'package:plants_odc/core/api/api_structure.dart';
import 'package:plants_odc/core/api/create_request.dart';

import '../constant/constants.dart';

class CreateAnyRequest extends APIStructure{
  String? bodystring;
  String endpointstring;
  Map<String, String>? headersmap;
  HTTPMethods methodhttp;
  Map<String, String>? querymap;

  CreateAnyRequest({this.bodystring,required this.endpointstring,this.headersmap,required this.methodhttp,this.querymap});
  @override
  get body => bodystring??"";

  @override
  String get endpoint => endpointstring;

  @override
  Map<String, String>? get headers => headersmap;

  @override
  HTTPMethods get method => methodhttp;

  @override
  String get path => APIServers.BASEURL;

  @override
  Map<String, String>? get query => querymap;

  @override
  Future<Response> request() {
    return CreateRequest.instance.request(this);
  }

  @override
  String get url => path+endpoint;
}