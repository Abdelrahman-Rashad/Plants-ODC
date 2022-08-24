import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plants_odc/features/forum/presentation/controller/forum_controller.dart';
import 'package:plants_odc/features/forum/presentation/pages/create_new_post.dart';

import '../../../../core/constant/colors.dart';
import '../widgets/cart_forum.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage>  with TickerProviderStateMixin{
  final controller=Get.find<ForumController>();
  @override
  Widget build(BuildContext context) {
        TabController tab = TabController(length: 2, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                       Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                    SizedBox(
                      width: 75.w,
                    ),
                    Text(
                      "Discussion Forums",
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  height: 50,
                  width: 350.w,
                  child: CupertinoSearchTextField(
                    onChanged: (value) {},
                    prefixInsets: EdgeInsets.only(left: 20.w),
                  ),
                ),      
                TabBar(
                          padding: EdgeInsets.only(right: 120.w,top: 20.w,bottom: 20.w),
                          labelStyle: Theme.of(context).textTheme.headline6,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.grey,
                          controller: tab,
                          
                          unselectedLabelStyle:
                              Theme.of(context).textTheme.headline5,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                           
                              borderRadius: BorderRadius.circular(10),
                              color: GREEN),
                          indicatorColor: GREEN,
                          
                          tabs: [
                            SizedBox(
                              width: 150.w,
                              height: 40.w,
                              child: const Tab(text: 'All Forums'),
                              
                            ),
                            SizedBox(
                              width: 150.w,
                              height: 40.w,
                              child: const Tab(text: 'My forums'),
                            ),
                            
                          ]),
                          SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(
                        () => Visibility(
                          visible: controller.isloaded.value,
                          replacement: const CircularProgressIndicator(),
                          child: SizedBox(
                            height: 575.h,
                            width: double.maxFinite,
                            child: TabBarView(controller: tab, children: [
                              displayCards(controller.forums),
                              displayCards(controller.myforums),
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
             ]
            ),
          ),
        )
        ),
        floatingActionButton: FloatingActionButton(  heroTag: null,
onPressed: (){Get.to(()=>const CreateNewPost());},child: Icon(Icons.add),backgroundColor: GREEN,),
    );
  }
}

Widget displayCards(List<dynamic> items) {
  return ListView.builder(

    itemBuilder: (context, index) {
      return CartForum(item: items[index]);
    },
    itemCount: items.length,
    );
}