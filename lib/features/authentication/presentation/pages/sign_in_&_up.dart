import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plants_odc/core/constant/colors.dart';
import 'package:plants_odc/features/authentication/presentation/widgets/sign_in_widget.dart';
import 'package:plants_odc/features/authentication/presentation/widgets/sign_up_widget.dart';
import '../controllers/auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>  with TickerProviderStateMixin{
  final controller = Get.find<AuthController>();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TabController tab=TabController(length: 2, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                children: [
                  Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/signin/planttop.png',
                  width: 150.w,
                  height: 150.w,
                ),
                ),
                Image.asset(
                'assets/signin/logo.png',
                width: 100.w,
                height: 100.w,
                ),
                ],
                ),
                Column(
                children: [
                  TabBar(
                    labelStyle: Theme.of(context).textTheme.headline6,
                    labelColor: GREEN,
                    unselectedLabelColor: Colors.grey,
                    controller: tab,
                    unselectedLabelStyle: Theme.of(context).textTheme.headline5,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: GREEN,
                    tabs: const [
                    Tab(text: 'Sign Up',),
                    Tab(text: "Login",)
                  ]),
                SizedBox(
                height: 780,
                width: double.maxFinite,
                child: TabBarView(
                  controller: tab,
                  children: [
                  SignUpWidget(controller: controller, formkey: formkey),
                  SignInWidget(controller: controller, formkey: formkey)
                ]),
                ),
                ],
                ),
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
