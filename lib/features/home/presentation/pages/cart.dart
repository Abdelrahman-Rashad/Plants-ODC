import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plants_odc/core/constant/colors.dart';
import 'package:plants_odc/features/home/presentation/controller/home_controller.dart';
import 'package:plants_odc/features/home/presentation/widgets/card_for_cart_page.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.w),
          child: Center(
            child: controller.cartofitems.isEmpty
                ? cartIsEmpty(context)
                : cartIsNotEmpty(context, controller),
          ),
        ),
      ),
    );
  }
}
// controller.cartofitems.isEmpty ? cartIsEmpty(context) :

Widget cartIsEmpty(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Text("My Cart", style: Theme.of(context).textTheme.headline1)),
      SizedBox(
        height: 100.w,
      ),
      Image.asset('assets/cart/Frame.png', width: 300.w, height: 300.w),
      Padding(
        padding: EdgeInsets.only(bottom: 20.w, top: 40.w),
        child: Text(
          "Your cart is empty",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      Text(
          "Sorry, the keyword you entered cannot be found, please check again or search with another keyword.",
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center),
      SizedBox(
        height: 150.w,
      )
    ],
  );
}

Widget cartIsNotEmpty(BuildContext context, HomeController controller) {
  return Column(
    children: [
      Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          SizedBox(
            width: 100.w,
          ),
          Align(
              alignment: Alignment.center,
              child: Text("My Cart",
                  style: Theme.of(context).textTheme.headline1)),
        ],
      ),
      SizedBox(
        height: 15.w,
      ),
      Expanded(
        child: Obx(() {
          return ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: controller.cartofitems.length,
              itemBuilder: (context, index) {
                return CardForCartPage(controller: controller, index: index);
              });
        }),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Obx(()=>
               Text(
                "${controller.totalPrice.value} EGP",
                style: TextStyle(
                    color: GREEN, fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15.w),
        child: SizedBox(
            width: 340.w,
            height: 50.h,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: const Text("Checkout"))),
      )
    ],
  );
}


