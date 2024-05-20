import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/routes/router.dart';
import 'common/utils/theme.dart';
import 'global.dart';

void main() async {
  await Global().init();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

final navKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375.0, 812.0),
      builder: (_, child) {
        return MaterialApp(
          title: 'App Book',
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          navigatorKey: navKey,
          onGenerateRoute: AppRouter.onGenerateRoute,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
        );
      },
    );
  }
}
