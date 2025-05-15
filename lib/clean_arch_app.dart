import 'package:clean_arch_app/core/routing/app_router.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/utils/app_consts.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/home/data/repository/home_repository_implmentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/routes.dart';

class CleanArchApp extends StatelessWidget {
  final AppRouter appRouter;
  const CleanArchApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        AppConsts.designScreenWidth,
        AppConsts.designScreenHeight,
      ),
      minTextAdapt: true,
      child: MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          scaffoldBackgroundColor: ColorManager.white,
          primaryColor: ColorManager.mainBlue,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: ColorManager.white,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
