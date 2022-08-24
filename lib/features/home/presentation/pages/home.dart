import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plants_odc/features/home/presentation/controller/home_controller.dart';
import 'package:plants_odc/features/home/presentation/widgets/card_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../core/constant/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    TabController tab = TabController(length: 4, vsync: this);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/signin/logo.png',
                        width: 100.w,
                        height: 100.w,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 15.w, left: 16.w, right: 16.w),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 330.w,
                              child:  CupertinoSearchTextField(
                                  onChanged: (value) {
                                    controller.searchproduct(value);
                                  },
                                  prefixInsets: EdgeInsets.only(left: 20.w),
                                ),
                              
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: GestureDetector(
                                onTap: () {Get.toNamed('/cart');},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: GREEN,
                                  ),
                                  height: 50.w,
                                  width: 50.w,
                                  child: Center(
                                      child: Image.asset(
                                    'assets/home/Cart.png',
                                    height: 25.w,
                                    width: 25.w,
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TabBar(
                          padding: EdgeInsets.all(10.w),
                          labelStyle: Theme.of(context).textTheme.headline6,
                          labelColor: GREEN,
                          unselectedLabelColor: Colors.grey,
                          controller: tab,
                          unselectedLabelStyle:
                              Theme.of(context).textTheme.headline5,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: const Border(
                                  top: BorderSide(width: 2.0, color: GREEN),
                                  bottom: BorderSide(width: 2.0, color: GREEN),
                                  left: BorderSide(width: 2.0, color: GREEN),
                                  right: BorderSide(width: 2.0, color: GREEN))),
                          indicatorColor: GREEN,
                          tabs: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: const Tab(text: 'All'),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: const Tab(text: 'Plants'),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: const Tab(
                                text: "Seeds",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: const Tab(
                                text: "Tools",
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(
                        () => Visibility(
                          visible: controller.isloaded.value,
                          replacement: const CircularProgressIndicator(),
                          child: SizedBox(
                            height: 550.h,
                            width: double.maxFinite,
                            child: TabBarView(controller: tab, children: [
                              displayCards(controller.foundproduct),
                              displayCards(controller.plants),
                              displayCards(controller.seeds),
                              displayCards(controller.tools),
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget displayCards(List<dynamic> items) {
  return MasonryGridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 10.w,

  crossAxisSpacing: 4.w,
    itemBuilder: (context, index) {
      return ItemCard(item: items[index]);
    },
    itemCount: items.length,
    );
}
