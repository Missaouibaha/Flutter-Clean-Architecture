import 'package:clean_arch_app/core/base/base_state.dart';
import 'package:clean_arch_app/core/widgets/error_dialog.dart';
import 'package:clean_arch_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:clean_arch_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBlocListener extends StatelessWidget {
  final Function(bool) onLoadingChanged;
  const ProfileBlocListener({super.key, required this.onLoadingChanged});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            onLoadingChanged(false);
          },
          success: (data) {
            onLoadingChanged(true);
          },
          error: (error) {
            onLoadingChanged(true);
            ErrorDialog.show(context, error);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
