import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plants_odc/core/constant/colors.dart';
import 'package:plants_odc/features/forum/presentation/pages/forum.dart';
import 'package:plants_odc/features/home/presentation/pages/fake_discussion.dart';
import 'package:plants_odc/features/home/presentation/pages/fake_notification.dart';
import 'package:plants_odc/features/home/presentation/pages/fake_scan.dart';
import 'package:plants_odc/features/home/presentation/pages/home.dart';
import 'package:plants_odc/features/profile/presentation/page/profile_page.dart';

import '../controller/home_controller.dart';

class ControlPage extends StatelessWidget {
  ControlPage({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      floatingActionButton: 
         Visibility(
          visible: !keyboardIsOpen,
          child: FloatingActionButton(
            
            backgroundColor: GREEN,
            onPressed: () {
              controller.changemypage(2);
            },
            child: const ImageIcon(
              AssetImage("assets/home/Home.png"),
            ),
          ),
        ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                controller.changemypage(0);
              },
              child: const ImageIcon(
                AssetImage("assets/home/leave.png"),
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 90.w),
              child: TextButton(
                onPressed: () {
                  controller.changemypage(1);
                },
                child:const ImageIcon(
                  AssetImage("assets/home/qr-code-scan.png"),
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                controller.changemypage(3);
              },
              child: const ImageIcon(
                AssetImage("assets/home/Bell.png"),
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/profile');
              },
              child: const ImageIcon(
                AssetImage("assets/home/profile.png"),
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: controller.mypage,
        children: [
          const ForumPage(),
          const FakeScan(),
          const HomePage(),
          const FakeNotification(),
          ProfilePage(),
        ],
      ),
    );
  }
}
