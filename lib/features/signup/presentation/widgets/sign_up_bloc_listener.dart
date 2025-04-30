import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/routing/routes.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/core/widgets/error_dialog.dart';
import 'package:clean_arch_app/core/widgets/loading_indicator.dart';
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
            LoadingIndicator.show(context);
          },
          successSignUp: (data) {
            LoadingIndicator.hide(context);
            context.pushNamedAndRemoveUntil(
              Routes.mainScreen,
              predicate: (Route<dynamic> route) => false,
            );
          },
          errorSignUp: (error) {
            LoadingIndicator.hide(context);

            ErrorDialog.show(context, error);
          },
          genderValidationError: () {
            ErrorDialog.show(context, AppStrings.enterGender);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
