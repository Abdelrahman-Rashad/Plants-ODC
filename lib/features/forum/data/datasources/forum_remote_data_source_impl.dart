import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:plants_odc/core/api/create_any_request.dart';
import 'package:plants_odc/features/forum/data/model/forum_model.dart';
import 'package:plants_odc/features/forum/domain/repositories/forum_repository.dart';

import '../../../../core/api/api_structure.dart';
import '../../../../core/constant/constants.dart';
import '../../../../core/constant/keys.dart';
import '../../../../main.dart';

class ForumRemoteDataSourceImpl extends ForumRepository{
  CreateAnyRequest? createAnyRequest;

  static final ForumRemoteDataSourceImpl _instance = ForumRemoteDataSourceImpl();
    static ForumRemoteDataSourceImpl getInstance(){
      return _instance;
   }
  @override
  Future<Response> getAllForums()async {
    Map<String,String> headersmap=<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':'Bearer ${prefs!.getString(ACCESSTOKEN)}',
      };
    createAnyRequest=CreateAnyRequest(endpointstring: APIServers.GETANDPOSTFORUMS, methodhttp: HTTPMethods.get,headersmap: headersmap);
    Response response=await createAnyRequest!.request();
    return response;
  }

  @override
  Future<Response> getMyForums()async {
    Map<String,String> headersmap=<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':'Bearer ${prefs!.getString(ACCESSTOKEN)}',
      };
    createAnyRequest=CreateAnyRequest(endpointstring: APIServers.GETMYFORUMS, methodhttp: HTTPMethods.get,headersmap: headersmap);
    Response response=await createAnyRequest!.request();
    return response;
  }

  @override
  Future<Response> postForums(ForumModel forum)async {
    String jsonstring=jsonEncode({
  "title": forum.title,
  "description": forum.description,
  "imageBase64": forum.imageUrl
});
    Map<String,String> headersmap=<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':'Bearer ${prefs!.getString(ACCESSTOKEN)}',
      };
    createAnyRequest=CreateAnyRequest(endpointstring: APIServers.GETANDPOSTFORUMS, methodhttp: HTTPMethods.get,headersmap: headersmap,bodystring: jsonstring);
    Response response=await createAnyRequest!.request();
    return response;
  }

}