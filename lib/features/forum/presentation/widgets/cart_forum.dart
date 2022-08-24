import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_odc/core/constant/colors.dart';
import 'package:plants_odc/features/forum/data/model/forum_model.dart';
import 'package:plants_odc/features/forum/presentation/controller/forum_controller.dart';

import '../../../../core/constant/constants.dart';

class CartForum extends StatelessWidget {
  CartForum({Key? key,required this.item}) : super(key: key);

  ForumModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.w),
      child: Container(
        width: double.infinity,
        height: 360.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Row(
                children: [
                  Image.asset('assets/forum/person.png'),
                  SizedBox(width: 10.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mayar Mohamed",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),),
                  SizedBox(height: 5.h,),
                  Text("a month ago",style: TextStyle(fontSize:11,fontWeight:FontWeight.w400))
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 5.w),
              child:  Text('${item.title}',style: TextStyle(fontSize: 15,color: GREEN,fontWeight: FontWeight.w700),),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 12.w),
              child:  Text('${item.description}',style: TextStyle(fontSize: 11,color: Colors.grey,fontWeight: FontWeight.w400),),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.w),
              child: FadeInImage.assetNetwork(
                    placeholder: 'assets/home/testplant.png',
                    width: double.infinity,
                    height: 110.h,
                    image:item.imageUrl!=""?"${APIServers.BASEURL}${item.imageUrl}":"${APIServers.BASEURL}/uploads/09be504b-99e3-481d-9653-9b6c791741dc.png"),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: GestureDetector(
                    onTap: (){},
                    child: Container(
                      child: Row(
                        children: [
                          ImageIcon(AssetImage('assets/forum/Group.png'),color: Colors.black54,),
                          Text(" ${item.forumLikes?.length}  Likes",style:TextStyle(color: Colors.black54,fontSize:11 )),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: GestureDetector(
                    onTap: (){},
                    child: Container(
                      child: Text(" ${item.forumComments?.length}  Replies",style:TextStyle(color: Colors.black54,fontSize:11 )),
                    ),
                  ),
                ),

              ],
            ),
            
          ],
        ),
        
      ),
    );
  }
}