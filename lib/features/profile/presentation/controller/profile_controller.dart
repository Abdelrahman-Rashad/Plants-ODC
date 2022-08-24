import 'package:get/get.dart';
import 'package:plants_odc/features/profile/data/models/profile_model.dart';
import '../../domain/usecases/get_user_data.dart';

class ProfileController extends GetxController{
  final profile=ProfieModel().obs;
  
  final GetUserDataUseCase profileusercase;
  ProfileController({required this.profileusercase});

  @override
  void onInit() {
    getUserDataController();
    super.onInit();
  }

  

  Rx<ProfieModel> getUserDataController(){
    try{
      profileusercase.execute().then((value) {
        print(value.body['data']);
          profile.value = ProfieModel.fromJson(value.body['data']);
        
      });
    }catch(e){
      // ignore: avoid_print
      print(e);
    }
    return profile;

  }
  
  
}