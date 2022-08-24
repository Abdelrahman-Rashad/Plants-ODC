import '../repositories/firebase_repositories.dart';

class SignInWithGoogleUseCase{
  final FirebaseRepository repository;

  SignInWithGoogleUseCase({required this.repository});
  Future<void> execute()async{
    return await repository.signInWithGoogle();
  }
}