import 'package:app_book/common/widgets/button_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/routes/route_constant.dart';
import '../../../../common/utils/image_constant.dart';
import '../../controller/splash_controller.dart';

class PageViewWidget extends ConsumerWidget {
  const PageViewWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.controller,
  });

  final String image;
  final String title;
  final String subTitle;
  final PageController? controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(splashControllerProvider);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40.h, right: 10.w),
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              controller!.animateToPage(2,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.decelerate);
              ref.watch(splashControllerProvider.notifier).indexChange(2);
            },
            child: Text(
              'Skip',
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
        SvgPicture.asset(
          image,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          alignment: Alignment.center,
          width: 300.w,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            subTitle,
            // softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          alignment: Alignment.center,
          height: 100.h,
          child: DotsIndicatorWidget(
            dotsCount: 3,
            position: index,
          ),
        )
      ],
    );
  }
}

class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget({
    super.key,
    required this.dotsCount,
    required this.position,
  });
  final int dotsCount;
  final int position;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      decorator: const DotsDecorator(
        activeSize: Size(20, 5),
        size: Size.square(8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

class ThirdPageViewWidget extends StatelessWidget {
  const ThirdPageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(ImageConstant.onboardingImage3),
        Positioned(
          top: 100,
          right: 110,
          child: Image.asset(ImageConstant.effectivePeopleBook),
        ),
        Positioned(
          right: 120,
          top: 280,
          child: Image.asset(ImageConstant.ikigaiBook),
        ),
        Positioned(
          right: 120,
          top: 430,
          child: Image.asset(ImageConstant.startUpBook),
        ),
        Positioned(
          left: -10,
          top: 100,
          child: Image.asset(ImageConstant.psycologyBook),
        ),
        Positioned(
          bottom: 300,
          child: Image.asset(ImageConstant.stealLikeBook),
        ),
        Positioned(
          top: 80,
          right: 0,
          child: Image.asset(ImageConstant.theAlchemistBook),
        ),
        Positioned(
          bottom: 300,
          right: 0,
          child: Image.asset(ImageConstant.richDadBook),
        ),
        Positioned(
          bottom: 50,
          child: Container(
            width: 380.w,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                Text(
                  'Book Has Power To Change Everything',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 300.w,
                  child: const Text(
                    'We have true friend in our life and the books is that. Book has power to chnage yourself and make you more valueable.',
                    // softWrap: true,
                    textAlign: TextAlign.center,
                    // style: TextStyle(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10.h,
                  ),
                  width: 280.w,
                  child: ButtonWidget(
                    text: 'Get Started Now',
                    verticalPadding: 14,
                    onPressed: () {
                      Navigator.of(context).pushNamed(RouteConstant.login);
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
