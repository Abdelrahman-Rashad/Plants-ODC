import 'package:get/get.dart';
import 'package:plants_odc/features/forum/data/model/forum_model.dart';

abstract class ForumRepository{
  Future<Response> getAllForums();
  Future<Response> getMyForums();
  Future<Response> postForums(ForumModel model);

}