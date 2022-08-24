import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:plants_odc/core/constant/keys.dart';
import 'package:plants_odc/main.dart';

class AuthMiddleware extends GetMiddleware{
  @override
  RouteSettings? redirect(String? route){
    if(prefs!.getString(ACCESSTOKEN)!=null) {
      print(prefs!.getString(ACCESSTOKEN));
      return const RouteSettings(name: "/home");
    }
    return null;
  }
}