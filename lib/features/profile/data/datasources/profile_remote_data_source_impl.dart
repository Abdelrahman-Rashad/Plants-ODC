import 'package:get/get_connect/http/src/response/response.dart';

import '../../../../core/api/api_structure.dart';
import '../../../../core/api/create_any_request.dart';
import '../../../../core/constant/constants.dart';
import '../../../../core/constant/keys.dart';
import '../../../../main.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRemoteDataSourceImpl extends ProfileRepository{
   CreateAnyRequest? createAnyRequest;

  static final ProfileRemoteDataSourceImpl _instance = ProfileRemoteDataSourceImpl();
    static ProfileRemoteDataSourceImpl getInstance(){
      return _instance;
   }

  @override
  Future<Response> getuserdata()async {
    Map<String,String> headersmap=<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':'Bearer ${prefs!.getString(ACCESSTOKEN)}',
      };
    createAnyRequest=CreateAnyRequest(endpointstring: APIServers.USER, methodhttp: HTTPMethods.get,headersmap: headersmap);
    Response response=await createAnyRequest!.request();
    return response;
  }

}