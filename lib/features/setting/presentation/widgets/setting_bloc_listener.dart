import 'package:clean_arch_app/core/base/base_state.dart';
import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/routing/routes.dart';
import 'package:clean_arch_app/core/widgets/error_dialog.dart';
import 'package:clean_arch_app/core/widgets/loading_indicator.dart';
import 'package:clean_arch_app/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:clean_arch_app/features/setting/presentation/cubit/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingBlocListener extends StatelessWidget {
  const SettingBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingCubit, SettingState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            
            LoadingIndicator.show(context);
          },
          success: (_) {
            LoadingIndicator.hide(context);

            context.pushNamedAndRemoveUntil(
              Routes.loginScreen,
              predicate: (route) {
                return false;
              },
            );
          },
          error: (error) {
            LoadingIndicator.hide(context);
            ErrorDialog.show(context, error);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
