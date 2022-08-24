

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plants_odc/core/constant/constants.dart';

import '../controller/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final controller=Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    int points= controller.profile.value.userPoints??30;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 430.h,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(

                        decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/profile/Rectangle.png'),
                          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.colorBurn),
                          fit: BoxFit.cover,
                        ),
                      ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage.assetNetwork(
                    placeholder: 'assets/profile/Ellipse.png',
                    width: 180.w,
                    height: 100.w,
                    image:"${controller.profile.value.imageUrl}"),
              ),                            SizedBox(height: 5.w,),
                            Text("${controller.profile.value.firstName} ${controller.profile.value.lastName}",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(padding: EdgeInsets.all(20.w),onPressed: (){Get.back();}, icon:const Icon(Icons.arrow_back,color: Colors.white,)),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(padding: EdgeInsets.all(20.w),onPressed: (){}, icon: const Icon(Icons.more_horiz_rounded,color: Colors.white,)),
                      ),
                      
                    ],
                  )
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 530.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r),)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.w),
                          child: Container(
                            width: double.infinity,
                            height: 100.h,
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(20),
                              color: Colors.lightGreen[50],
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 20.w,),
                                Image.asset('assets/profile/Group.png'),
                                SizedBox(width: 10.w),
                                Text("You have $points points",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                          child: const Align(alignment: Alignment.centerLeft,child: Text("Edit Profile",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500))),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.w),
                          child: Container(
                            width: double.infinity,
                            height: 100.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [BoxShadow(
                                color: Colors.black12,
                                blurRadius: 7,
                                spreadRadius: 3
                              )],
                              borderRadius:BorderRadius.circular(10.r),
                              
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 20.w,),
                                Image.asset('assets/profile/icon.png'),
                                SizedBox(width: 10.w),
                                const Text("Change Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                                SizedBox(width: 120.w),
                                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.w),
                          child: Container(
                            width: double.infinity,
                            height: 100.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [BoxShadow(
                                color: Colors.black12,
                                blurRadius: 7,
                                spreadRadius: 3
                              )],
                              borderRadius:BorderRadius.circular(10.r),
                              
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 20.w,),
                                Image.asset('assets/profile/icon.png'),
                                SizedBox(width: 10.w),
                                const Text("Change Email",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                                SizedBox(width: 120.w),
                                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}

/*Container(
                child: Image.network("${APIServers.BASEURL}${controller.profile.value.imageUrl}",filterQuality: FilterQuality.medium),
                
              ),*/