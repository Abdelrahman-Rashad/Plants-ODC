import 'package:get/get_connect.dart';
import 'package:plants_odc/features/authentication/data/models/user_model.dart';


abstract class FirebaseRepository{
  Future<void> signInWithGoogle();
  Future<void> signInWithFacebook();
  Future<Response> signIn(String email , String password);
  Future<Response> signUp(UserModel user);
  Future<void> signOut();

}