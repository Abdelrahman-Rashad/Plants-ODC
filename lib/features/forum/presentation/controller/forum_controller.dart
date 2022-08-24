import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:plants_odc/features/forum/domain/usecases/get_all_forums.dart';
import 'package:plants_odc/features/forum/domain/usecases/get_my_forums.dart';
import 'package:plants_odc/features/forum/domain/usecases/post_forums.dart';

import '../../data/model/forum_model.dart';

class ForumController extends GetxController{
  GetAllForumsUseCase getallforum;
  GetMyForumsUseCase getmyforum;
  PostForumsUseCase postforum;
  RxBool isloaded=true.obs;
  List<ForumModel> forums=<ForumModel>[].obs;
  List<ForumModel> myforums=<ForumModel>[].obs;


  ForumController({required this.getallforum,required this.getmyforum,required this.postforum});

  @override
  void onInit() {
    getAllForumsController();
    getMyForumsController();
    super.onInit();
  }

  getAllForumsController(){
    try{
     getallforum.execute().then((value) {
      for(var item in value.body["data"])
        {
          forums.add(ForumModel.fromJson(item));
        }
      
     });

    }catch(e){
      // ignore: avoid_print
      print(e);
    }
  }

getMyForumsController(){
    try{
     getmyforum.execute().then((value) {
      for(var item in value.body["data"])
        {
          myforums.add(ForumModel.fromJson(item));
        }
      
     });

    }catch(e){
      // ignore: avoid_print
      print(e);
    }
  }
  postForumsController(ForumModel item){
    try{
     postforum.execute(item).then((value) {
      print("created successfully");
     });

    }catch(e){
      // ignore: avoid_print
      print(e);
    }
  }
}