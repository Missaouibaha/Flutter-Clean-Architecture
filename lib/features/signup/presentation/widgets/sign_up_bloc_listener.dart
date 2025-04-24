import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/routing/routes.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/signup/presentation/cubit/sign_up_cubit.dart';
import 'package:clean_arch_app/features/signup/presentation/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen:
          (previous, current) =>
              current is LoadingSignUp ||
              current is SuccessSignUp ||
              current is ErrorSignUp ||
              current is GenderValidationError,
      listener: (context, state) {
        state.whenOrNull(
          loadingSignUp: () {
            showDialog(
              context: context,
              builder:
                  (context) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.skyBlue,
                    ),
                  ),
            );
          },
          successSignUp: (data) {
            context.pop();
            context.pushNamedAndRemoveUntil(
              Routes.mainScreen,
              predicate: (Route<dynamic> route) => false,
            );
          },
          errorSignUp: (error) {
            context.pop();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(error, style: TextStyles.font14DarckBlueMedium),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text(
                        AppStrings.OK,
                        style: TextStyles.font14DarckBlueMedium,
                      ),
                    ),
                  ],
                );
              },
            );
          },
          genderValidationError: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(
                    AppStrings.enterGender,
                    style: TextStyles.font14DarckBlueMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text(
                        AppStrings.OK,
                        style: TextStyles.font14DarckBlueMedium,
                      ),
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
