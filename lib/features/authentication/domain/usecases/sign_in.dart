import 'package:get/get.dart';
import '../repositories/firebase_repositories.dart';

class SignInUseCase{
  final FirebaseRepository repository;

  SignInUseCase({required this.repository});
  Future<Response> execute(String email, String password)async{
    return await repository.signIn(email,password);
  }
}