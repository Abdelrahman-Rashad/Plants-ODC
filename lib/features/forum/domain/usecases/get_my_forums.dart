import 'package:get/get.dart';
import '../repositories/forum_repository.dart';

class GetMyForumsUseCase{
  final ForumRepository repository;

  GetMyForumsUseCase({required this.repository});
  Future<Response> execute()async{
    return await repository.getMyForums();
  }
}