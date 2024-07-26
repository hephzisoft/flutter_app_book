import 'package:app_book/common/routes/route_constant.dart';
import 'package:flutter/material.dart';

import '../../features/features_export.dart';
import '../../features/login/view/widgets/forget_password_screen.dart';
import '../../global.dart';

class AppRouter {
  static List<RouteList> routes() {
    return [
      RouteList(
        routeName: RouteConstant.splash,
        widget: const SplashScreen(),
      ),
      RouteList(
        routeName: RouteConstant.login,
        widget: const LoginScreen(),
      ),
      RouteList(
        routeName: RouteConstant.tab,
        widget: const TabScreen(),
      ),
      RouteList(
        routeName: RouteConstant.tab,
        widget: const TabScreen(),
      ),
      RouteList(
        routeName: RouteConstant.signup,
        widget: const RegisterScreen(),
      ),
      RouteList(
        routeName: RouteConstant.forgetPassword,
        widget: const ForgetPasswordScreen(),
      ),
    ];
  }

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    if (settings.name != null) {
      var route =
          routes().where((element) => element.routeName == settings.name);
      if (route.isNotEmpty) {
        bool isFirstTime = Global.storageService.isDeviceFirstTime();
        if (route.first.routeName == RouteConstant.splash && isFirstTime) {
          final isLoggedIn = Global.storageService.isLoggedIn();


          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (context) => const TabScreen(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (context) => const LoginScreen(), settings: settings);
        } else {
          return MaterialPageRoute(
              builder: (context) => route.first.widget, settings: settings);
        }
      }
    }
    return MaterialPageRoute(
        builder: (context) => const LoginScreen(), settings: settings);
  }
}

class RouteList {
  final String routeName;
  final Widget widget;

  RouteList({
    required this.routeName,
    required this.widget,
  });
}
