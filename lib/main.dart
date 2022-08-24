import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:plants_odc/core/binding/all_binding.dart';
import 'package:plants_odc/core/constant/colors.dart';
import 'package:plants_odc/features/authentication/presentation/controllers/auth_middleware.dart';
import 'package:plants_odc/features/authentication/presentation/pages/sign_in_&_up.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_odc/features/home/presentation/pages/control_page.dart';
import 'package:plants_odc/features/home/presentation/pages/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/profile/presentation/page/profile_page.dart';

SharedPreferences? prefs ;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  prefs=await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(context,child)=> GetMaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: GREEN,
          ),
          textTheme:const TextTheme(
            headline6:  TextStyle(fontSize: 18,color:Colors.grey,fontWeight: FontWeight.w600 ),
            headline5:  TextStyle(fontSize: 18,color:Colors.grey,fontWeight: FontWeight.w400 ),
            headline4:  TextStyle(fontSize: 12,color:Colors.grey,fontWeight: FontWeight.w400 ),
            headline3:  TextStyle(fontSize: 16,color:Colors.black,fontWeight: FontWeight.w500 ),
            headline2:  TextStyle(fontSize: 12,color:Colors.black,fontWeight: FontWeight.w500 ),
            headline1:  TextStyle(fontSize: 25,color:Colors.black,fontWeight: FontWeight.bold ),
            subtitle1:  TextStyle(fontSize: 15,color:GREEN,fontWeight: FontWeight.w500 ),
            subtitle2: TextStyle(fontSize: 18,color:Colors.black,fontWeight: FontWeight.w500 ),
            button:  TextStyle(fontSize: 16,color:Colors.white ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: ()=>const AuthPage(),binding:AllBinding(),middlewares: [AuthMiddleware()]),
          //GetPage(name: '/', page: ()=>AuthPage(),binding:AllBinding()),
          GetPage(name: '/home', page: ()=> ControlPage(),binding:AllBinding()),
          GetPage(name: '/cart', page: ()=> Cart(),binding:AllBinding()),
          GetPage(name: '/profile', page: ()=> ProfilePage(),binding:AllBinding()),
        ],
      ),
      designSize: const Size(428, 926),
    );
  }
}