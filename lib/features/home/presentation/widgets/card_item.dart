import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plants_odc/features/home/data/models/product_model.dart';
import '../../../../core/constant/constants.dart';
import '../controller/home_controller.dart';

class ItemCard extends StatelessWidget {
  ItemCard({Key? key, required this.item}) : super(key: key);
  dynamic item;
  final controller=Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w ),
      child: GestureDetector(
        onTap: (){},
        child: SizedBox(
          width: 150.w,
          height: 250.w,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              AspectRatio(
                aspectRatio: 0.9,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12, blurRadius: 2, spreadRadius: 0.5)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          item.runtimeType==ProductModel?"${item.price} EGP":"70 EGP",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        SizedBox(
                          width: 170.w,
                          height: 35.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                            ),
                              onPressed: () {
                                controller.addItemToCart(item);
                              }, child:const Text("Add To Cart")),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top:75.w,
                right: 5.w,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 25.w,
                        height: 25.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                        ),
                        child: const ImageIcon(
                  AssetImage("assets/home/minus.png"),
                  color: Colors.grey,
                ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text("1",style: Theme.of(context).textTheme.headline3,),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 25.w,
                        height: 25.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                        ),
                        child: const ImageIcon(
                  AssetImage("assets/home/plus.png"),
                  color: Colors.grey,
                ),
                      ),
                    ),
                  ],)
                ),
              Positioned(
                top: 0,
                left: 0,
                right: 55.w,
                bottom: 110.w,
                child: AspectRatio(
                    aspectRatio: 1.5,
                    child:  ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                    placeholder: 'assets/home/testplant.png',
                    width: 105.w,
                    height: 200.w,
                    image:item.imageUrl!=""?"${APIServers.BASEURL}${item.imageUrl}":"${APIServers.BASEURL}/uploads/09be504b-99e3-481d-9653-9b6c791741dc.png"),
              ),
                    ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}
/*Container(
        color: Colors.amber,
            width: 150.w,
            
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                
                AspectRatio(
                  aspectRatio: 1.10,
                  child: Container(
                    decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 5,spreadRadius: 1)],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("GARDENIA PLANT",style: Theme.of(context).textTheme.headline3,),
                        Text("70 EGP",style: Theme.of(context).textTheme.headline2,),
                        SizedBox(height: 10.w,),
                        SizedBox(
            width: 120.w,
            height: 35.w,
            child: ElevatedButton(
                onPressed: (){},
                child: Text("Add To Cart")),
          ),
                        

                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,

                  child: AspectRatio(aspectRatio: 1.5,
                  child: Image.asset('assets/home/testplant.png',alignment: Alignment.topLeft,)),
                ),
              ],
            ),
          ),*/