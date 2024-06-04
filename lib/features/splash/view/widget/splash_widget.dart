import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/utils/image_constant.dart';
import '../../controller/splash_controller.dart';

class PageViewWidget extends ConsumerWidget {
  const PageViewWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(splashControllerProvider);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40.h, right: 10.w),
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
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
          width: 300.w,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            subTitle,
            softWrap: true,
            style: const TextStyle(),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        DotsIndicatorWidget(
          dotsCount: 3,
          position: index,
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
      position: 1,
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
          child: Image.asset(ImageConstant.effectivePeopleBook),
        )
      ],
    );
  }
}
