import 'dart:io';
import 'package:get/get.dart';
import 'package:plants_odc/core/api/api_structure.dart';
import '../exception/api_errors.dart';

class CreateRequest{
  final client =GetConnect();

  static final _instance=CreateRequest();
  static CreateRequest get instance=> _instance;

  Future<Response> request(APIStructure request)async{
    try{
      final response =await client.request(
        request.url,
        request.method.string,
        headers: request.headers,
        query: request.query,
        body: request.body);
        return _returnResponse(response);
    }on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
  
  Response _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
