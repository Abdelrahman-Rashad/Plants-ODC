import 'package:get/get_connect/http/src/response/response.dart';
import 'package:plants_odc/features/profile/data/datasources/profile_remote_data_source_impl.dart';

import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository{
  ProfileRemoteDataSourceImpl impl;
  ProfileRepositoryImpl({required this.impl});
  @override
  Future<Response> getuserdata()async {
    return await impl.getuserdata();
  }

}