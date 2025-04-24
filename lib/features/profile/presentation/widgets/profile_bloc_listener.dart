import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:clean_arch_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBlocListener extends StatelessWidget {
  const ProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
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
          success: (data) {
            print('poped on success');
            context.pop();
          },
          error: (error) {
            print('poped on fail');
            context.pop();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  content: Text(error, style: TextStyles.font14DarckBlueMedium),
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
