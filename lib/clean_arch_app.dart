import 'package:clean_arch_app/core/routing/app_router.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/routes.dart';

class CleanArchApp extends StatelessWidget {
  final AppRouter appRouter;
  const CleanArchApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 670),
      minTextAdapt: true,
      child: MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
