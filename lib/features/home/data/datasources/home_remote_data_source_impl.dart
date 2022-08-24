import 'package:get/get_connect/http/src/response/response.dart';
import 'package:plants_odc/core/api/create_any_request.dart';
import 'package:plants_odc/core/constant/keys.dart';
import 'package:plants_odc/main.dart';
import '../../../../core/api/api_structure.dart';
import '../../domain/repositories/home_repository.dart';
import 'package:plants_odc/core/constant/constants.dart';

class HomeRemoteDataSourceImpl extends HomeRepository{
  CreateAnyRequest? createAnyRequest;
  @override
  Future<Response> getSeeds() async{
    Map<String,String> headersmap=<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':'Bearer ${prefs!.getString(ACCESSTOKEN)}',
      };
    createAnyRequest=CreateAnyRequest(endpointstring: APIServers.SEEDS, methodhttp: HTTPMethods.get,headersmap: headersmap);
    Response response=await createAnyRequest!.request();
    return response;
  }

  @override
  Future<Response> getTools() async{
Map<String,String> headersmap=<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':'Bearer ${prefs!.getString(ACCESSTOKEN)}',
      };
    createAnyRequest=CreateAnyRequest(endpointstring: APIServers.TOOLS, methodhttp: HTTPMethods.get,headersmap: headersmap);
    Response response=await createAnyRequest!.request();
    return response;  }

  @override
  Future<Response> getplants() async{
    String? token= prefs!.getString(ACCESSTOKEN);

Map<String,String> headersmap=<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
      };
    createAnyRequest=CreateAnyRequest(endpointstring: APIServers.PLANTS, methodhttp: HTTPMethods.get,headersmap: headersmap);
    Response response=await createAnyRequest!.request();
    return response;  }

    static final HomeRemoteDataSourceImpl _instance = HomeRemoteDataSourceImpl();
    static HomeRemoteDataSourceImpl getInstance(){
      return _instance;
   }
   
     @override
     Future<Response> getProducts() async{
    String? token= prefs!.getString(ACCESSTOKEN);

Map<String,String> headersmap=<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
      };
    createAnyRequest=CreateAnyRequest(endpointstring: APIServers.PRODUCTS, methodhttp: HTTPMethods.get,headersmap: headersmap);
    Response response=await createAnyRequest!.request();
    return response;
     }

}
