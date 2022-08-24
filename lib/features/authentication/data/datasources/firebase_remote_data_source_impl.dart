import 'dart:convert';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plants_odc/core/constant/constants.dart';
import 'package:plants_odc/features/authentication/data/models/user_model.dart';
import '../../../../core/api/api_structure.dart';
import '../../../../core/api/create_any_request.dart';
import '../../domain/repositories/firebase_repositories.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRemoteDataSourceImpl extends FirebaseRepository {
  final FirebaseAuth auth=FirebaseAuth.instance;
  String _authException = "Authentication Failure";
  CreateAnyRequest? createAnyRequest;
  
  @override
  Future<Response> signIn(String email, String password) async {
    
    String jsonstring=jsonEncode({'password':password,'email':email});
      Map<String,String> headersmap=<String, String>{'Content-Type': 'application/json; charset=UTF-8'};
       createAnyRequest=CreateAnyRequest(endpointstring: APIServers.SIGNIN,methodhttp: HTTPMethods.post,bodystring: jsonstring,headersmap: headersmap);
      Response response=await createAnyRequest!.request();
      
      return response;

  }
  @override
  Future<Response> signUp(UserModel user) async {
    
   
      String jsonstring=jsonEncode({
  "firstName": user.firstName,
  "lastName": user.lastName,
  "email": user.email,
  "password": user.password});
      Map<String,String> headersmap=<String, String>{'Content-Type': 'application/json; charset=UTF-8'};
      createAnyRequest=CreateAnyRequest(endpointstring: APIServers.SIGNUP,methodhttp: HTTPMethods.post,bodystring: jsonstring,headersmap: headersmap);
      Response response=await createAnyRequest!.request();
      return response;
   
  }

  @override
  Future<void> signInWithGoogle() async {
    
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      //print(credential.accessToken);
      Map<String,String> headersmap=<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':'Bearer ${credential.accessToken}',
      };
    createAnyRequest=CreateAnyRequest(endpointstring: APIServers.SIGNINWITHGOOGLE, methodhttp: HTTPMethods.post,headersmap: headersmap);
    //Response response=await createAnyRequest!.request();
     // print(response.body);
  }

  @override
  Future<void> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      auth.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      _authException = e.message.toString();
    }
  }

  

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  String get authException => _authException;

  static final FirebaseRemoteDataSourceImpl _instance=FirebaseRemoteDataSourceImpl();
  static FirebaseRemoteDataSourceImpl getInstance(){
      return _instance;
   }
  
  
}

