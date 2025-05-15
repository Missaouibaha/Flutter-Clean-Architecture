import 'package:clean_arch_app/core/di/dependency_injection.dart';
import 'package:clean_arch_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:clean_arch_app/features/login/presentation/login_screen.dart';
import 'package:clean_arch_app/features/main/main_screen.dart';
import 'package:clean_arch_app/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:clean_arch_app/features/setting/setting_screen.dart';
import 'package:clean_arch_app/features/signup/presentation/cubit/sign_up_cubit.dart';
import 'package:clean_arch_app/features/signup/sign_up_screen.dart';
import 'package:clean_arch_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:clean_arch_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SplashCubit>(),
                child: SplashScreen(),
              ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: LoginScreen(),
              ),
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(body: Center(child: Text('------')));
          },
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider(
              create: (context) => getIt<SignUpCubit>(),
              child: SignUpScreen(),
            );
          },
        );

      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) {
            return MainScreen();
          },
        );
         case Routes.settingScreen:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider(
              create: (context) => getIt<SettingCubit>(),
              child: SettingScreen(),
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(body: Center(child: Text('------')));
          },
        );
    }
  }
}
