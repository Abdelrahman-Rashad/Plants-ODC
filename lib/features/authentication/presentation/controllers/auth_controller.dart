import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:plants_odc/core/constant/keys.dart';
import 'package:plants_odc/features/authentication/data/models/user_model.dart';
import 'package:plants_odc/features/authentication/domain/usecases/sign_in_with_google.dart';
import 'package:plants_odc/features/authentication/domain/usecases/sign_up.dart';
import 'package:plants_odc/main.dart';

import '../../domain/usecases/sign_in.dart';

class AuthController extends GetxController{
  final SignUpUseCase signUp;
  final SignInUseCase signIn;
  final SignInWithGoogleUseCase google;
  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  AuthController({required this.signUp,required this.signIn,required this.google});

  signInController(String email,String password)async{
    try{
     signIn.execute(email,password).then((value) {
      
      prefs!.setString(ACCESSTOKEN, value.body['data']['accessToken']);
     });

    }catch(e){
      // ignore: avoid_print
      print(e);
    }
  }
  signUpController(UserModel user)async{
    try{
      
      signUp.execute(user).then((value) {
     });
      
    }catch(e){
      // ignore: avoid_print
      print(e);
    }
  }
  signInWithGoogleController()async{
    try{
      
      google.execute();
      
    }catch(e){
      // ignore: avoid_print
      print(e);
    }
  }
  @override
  void dispose() {
    firstname.dispose();
    lastname.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

}