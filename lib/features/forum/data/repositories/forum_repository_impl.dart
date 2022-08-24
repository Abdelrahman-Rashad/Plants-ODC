import 'package:get/get_connect/http/src/response/response.dart';
import 'package:plants_odc/features/forum/data/datasources/forum_remote_data_source_impl.dart';

import '../../domain/repositories/forum_repository.dart';
import '../model/forum_model.dart';

class ForumRepositoryImpl extends ForumRepository{
  final ForumRemoteDataSourceImpl remoteDataSource;
  ForumRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Response> getAllForums()async {
    return await remoteDataSource.getAllForums();
  }

  @override
  Future<Response> getMyForums() async {
    return await remoteDataSource.getMyForums();

  }

  @override
  Future<Response> postForums(ForumModel model)async {
    return await remoteDataSource.postForums(model);

  }
  
}