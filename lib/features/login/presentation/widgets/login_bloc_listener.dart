import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/routing/routes.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:clean_arch_app/features/login/presentation/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder:
                  (context) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.mainBlue,
                    ),
                  ),
            );
          },
          success: (loginUserResponse) {
            context.pop();
            context.pushReplacementNamed(Routes.mainScreen);
          },
          error: (loginError) {
            context.pop();
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(backgroundColor: Colors.white,
                    content: Text(
                      loginError,
                      style: TextStyles.font14DarckBlueMedium,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text(
                          AppStrings.OK,
                          style: TextStyles.font14DarckBlueMedium,
                        ),
                      ),
                    ],
                  ),
            );
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
