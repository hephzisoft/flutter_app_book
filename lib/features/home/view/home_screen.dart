import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/image_constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.bell,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recommended for you',
                style: TextStyle(
                  fontSize: 20.sp,

                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Handpicked based on your reading preferences.',
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 300.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) => Container(
                    child: Image.asset(
                      ImageConstant.richDadBook,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
