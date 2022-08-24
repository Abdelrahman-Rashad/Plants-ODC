import 'package:get/get.dart';
import 'package:plants_odc/features/forum/data/model/forum_model.dart';
import 'package:plants_odc/features/forum/domain/entities/forum.dart';
import '../repositories/forum_repository.dart';

class PostForumsUseCase{
  final ForumRepository repository;

  PostForumsUseCase({required this.repository});
  Future<Response> execute(ForumModel model)async{
    return await repository.postForums(model);
  }
}