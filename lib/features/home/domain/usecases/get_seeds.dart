import 'package:get/get.dart';
import 'package:plants_odc/features/home/domain/repositories/home_repository.dart';

class GetSeedsUseCase{
  HomeRepository home;

  GetSeedsUseCase({required this.home});

  Future<Response> execute()async{
    return await home.getSeeds();
  }
}