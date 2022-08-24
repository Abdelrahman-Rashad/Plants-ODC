import 'package:get/get_connect/http/src/response/response.dart';
import 'package:plants_odc/features/home/data/datasources/home_remote_data_source_impl.dart';

import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository{
  HomeRemoteDataSourceImpl? dataSource;
  HomeRepositoryImpl({required this.dataSource});
  @override
  Future<Response> getSeeds()async {
    return await dataSource!.getSeeds();
  }

  @override
  Future<Response> getTools() async {
    return await dataSource!.getTools();
  }

  @override
  Future<Response> getplants() async {
    return await dataSource!.getplants();
  }
  
  @override
  Future<Response> getProducts()async {
        return await dataSource!.getProducts();
  }

}