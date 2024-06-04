import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/image_constant.dart';
import 'widget/splash_widget.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          const PageViewWidget(
            image: ImageConstant.girlReading,
            title: 'Only Books Can Help You',
            subTitle:
                'Books can help you to increase your knowledge and become more successfully.',
          ),
          PageViewWidget(
            image: ImageConstant.peopleReading,
            title: 'Learn Smartly',
            subTitle:
                "It’s ${DateTime.now().year} and it’s time to learn every quickly and smartly. All books are storage in cloud and you can access all of them from your phone.",
          ),
          const ThirdPageViewWidget()
        ],
      ),
    );
  }
}
