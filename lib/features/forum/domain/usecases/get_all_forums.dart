import 'package:get/get.dart';
import '../repositories/forum_repository.dart';

class GetAllForumsUseCase{
  final ForumRepository repository;

  GetAllForumsUseCase({required this.repository});
  Future<Response> execute()async{
    return await repository.getAllForums();
  }
}