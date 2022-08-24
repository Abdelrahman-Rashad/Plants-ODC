import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plants_odc/features/authentication/presentation/controllers/auth_controller.dart';

import '../../data/models/user_model.dart';

class SignUpWidget extends StatelessWidget {
  SignUpWidget({Key? key, required this.controller, required this.formkey})
      : super(key: key);
  AuthController controller;
  // ignore: prefer_typing_uninitialized_variables
  final formkey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40.w,left: 45.w),
          child: const Align(
            alignment: Alignment.centerLeft,
            child:  Text("First Name")),
        ),
        Padding(
          padding: EdgeInsets.only(left: 45.w, right: 45.w,top:5.w),
          child: TextFormField(
            controller: controller.firstname,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40.w,left: 45.w),
          child: const Align(
            alignment: Alignment.centerLeft,
            child:  Text("Last Name")),
        ),
        Padding(
          padding: EdgeInsets.only(left: 45.w, right: 45.w,top:5.w),
          child: TextFormField(
            controller: controller.lastname,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40.w,left: 45.w),
          child: const Align(
            alignment: Alignment.centerLeft,
            child:  Text("Email")),
        ),
        Padding(
          padding: EdgeInsets.only(left: 45.w, right: 45.w,top:5.w),
          child: TextFormField(
            controller: controller.email,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40.w,left: 45.w),
          child: const Align(
            alignment: Alignment.centerLeft,
            child:  Text("Password")),
        ),
        Padding(
          padding: EdgeInsets.only(left: 45.w, right: 45.w, top:5.w),
          child: TextFormField(
            controller: controller.password,
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 45.w, right: 45.w, top: 36.w),
          child: SizedBox(
            width: 337.w,
            height: 55.w,
            child: ElevatedButton(
                onPressed: () {
                  if(formkey.currentState!.validate()){
                    UserModel user=UserModel(firstName: controller.firstname.text.trim(),lastName: controller.lastname.text.trim(),email: controller.email.text.trim(),password: controller.password.text.trim());
                    controller.signUpController(user);
                     Get.toNamed('/home');
                  }
                },
                child: const Text("Login")),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 42.w, right: 42.w, top: 25.w),
          child: Row(
            children: [
              const Expanded(
                  child: Divider(
                color: Colors.grey,
                thickness: 1,
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  "or continue with",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              const Expanded(
                  child: Divider(
                color: Colors.grey,
                thickness: 1,
              )),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: Image.asset(
                  'assets/signin/Google.png',
                  width: 30.w,
                  height: 30.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Image.asset(
                  'assets/signin/Facebook.png',
                  width: 30.w,
                  height: 30.w,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset('assets/signin/plantbottom.png',
              width: 150.w, height: 150.w),
        ),
      ],
    );
  }
}
