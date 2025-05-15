import 'package:clean_arch_app/core/base/base_state.dart';
import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/routing/routes.dart';
import 'package:clean_arch_app/core/widgets/error_dialog.dart';
import 'package:clean_arch_app/core/widgets/loading_indicator.dart';
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
            LoadingIndicator.show(context);
          },
          success: (loginUserResponse) {
            LoadingIndicator.hide(context);
            context.pushReplacementNamed(Routes.mainScreen);
          },
          error: (loginError) {
            LoadingIndicator.hide(context);
            ErrorDialog.show(context, loginError);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
