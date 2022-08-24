import 'package:get/get.dart';
import 'package:plants_odc/features/authentication/data/models/user_model.dart';

import '../repositories/firebase_repositories.dart';

class SignUpUseCase{
  final FirebaseRepository repository;

  SignUpUseCase({required this.repository});
  Future<Response> execute(UserModel user)async{
    return await repository.signUp(user);
  }
}