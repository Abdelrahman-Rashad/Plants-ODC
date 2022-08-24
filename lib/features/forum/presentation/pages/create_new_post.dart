import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPost extends StatelessWidget {
  const CreateNewPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      "Create New Post",
                      style: Theme.of(context).textTheme.subtitle2,
                    )
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
