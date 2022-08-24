import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/constants.dart';
import '../../data/models/product_model.dart';
import '../controller/home_controller.dart';

class CardForCartPage extends StatelessWidget {
  CardForCartPage({Key? key, required this.controller, required this.index})
      : super(key: key);
  HomeController controller;
  int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: SizedBox(
          height: 160.w,
          width: 300.w,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                    placeholder: 'assets/home/testplant.png',
                    width: 105.w,
                    height: 200.w,
                    image:controller.cartofitems[index].imageUrl!=""?"${APIServers.BASEURL}${controller.cartofitems[index].imageUrl}":"${APIServers.BASEURL}/uploads/09be504b-99e3-481d-9653-9b6c791741dc.png"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15.w),
                      child: Text(controller.cartofitems[index].name,
                          style: Theme.of(context).textTheme.subtitle2),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.w),
                      child: Text(controller.cartofitems[index].runtimeType==ProductModel?"${controller.cartofitems[index].price} EGP":"70 EGP",
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.w),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10)),
                            width: 80.w,
                            height: 40.w,
                            child: Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.decrementCount(
                                          controller.cartofitems[index]);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 18.w),
                                      child: const Icon(
                                        Icons.minimize,
                                        color: GREEN,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text("${controller.countItems[index].value}",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.incrementcount(
                                          controller.cartofitems[index]);
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: GREEN,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 70.w,
                          ),
                          IconButton(
                            onPressed: () {
                              controller.deleteItemFromCart(
                                  controller.cartofitems[index]);
                            },
                            icon: Icon(Icons.delete, size: 40.w, color: GREEN),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
