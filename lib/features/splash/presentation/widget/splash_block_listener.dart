import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/routing/routes.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBlockListener extends StatelessWidget {
  const SplashBlockListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listenWhen:
          (previous, current) =>
              current is SuccessCheckStatus || current is FailureCheckStatus,
      listener: (context, state) {
        state.whenOrNull(
          successCheckStatus: (isLoggedIn) {
            if (isLoggedIn) {
              context.pushReplacementNamed(Routes.mainScreen);
            } else {
              context.pushReplacementNamed(Routes. loginScreen);
            }
          },

          failureCheckStatus: (errro) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(AppStrings.errorOccurredFetshUser),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pushReplacementNamed(Routes.loginScreen);
                      },
                      child: Text(AppStrings.OK),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
