import 'package:get/get.dart';
import 'package:plants_odc/features/profile/domain/repositories/profile_repository.dart';

class GetUserDataUseCase{
  ProfileRepository profile;

  GetUserDataUseCase({required this.profile});

  Future<Response> execute()async{
    return await profile.getuserdata();
  }
}