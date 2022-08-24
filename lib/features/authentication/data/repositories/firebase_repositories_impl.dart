import 'package:get/get.dart';
import 'package:plants_odc/features/authentication/data/models/user_model.dart';
import 'package:plants_odc/features/authentication/domain/repositories/firebase_repositories.dart';

import '../datasources/firebase_remote_data_source_impl.dart';

class FirebaseRepositoriesImpl implements FirebaseRepository {
  final FirebaseRemoteDataSourceImpl remoteDataSource;
  FirebaseRepositoriesImpl({required this.remoteDataSource});

  @override
  Future<Response> signIn(String email, String password) async {
    return await remoteDataSource.signIn(email, password);
  }

  @override
  Future<void> signInWithGoogle() async {
    await remoteDataSource.signInWithGoogle();
  }

  @override
  Future<void> signInWithFacebook() async {
    await remoteDataSource.signInWithFacebook();
  }

  @override
  Future<Response> signUp(UserModel user) async {
    return await remoteDataSource.signUp(user);
  }

  @override
  Future<void> signOut() async {
    await remoteDataSource.signOut();
  }
  
  
}
