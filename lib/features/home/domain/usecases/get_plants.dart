import 'package:get/get.dart';
import 'package:plants_odc/features/home/domain/repositories/home_repository.dart';

class GetPlantsUseCase{
  HomeRepository home;

  GetPlantsUseCase({required this.home});

  Future<Response> execute()async{
    return await home.getplants();
  }
}