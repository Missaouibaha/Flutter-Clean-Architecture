import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/features/profile/domain/entities/user.dart';
import 'package:clean_arch_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:clean_arch_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUserData extends StatefulWidget {
  const ProfileUserData({super.key});

  @override
  State<ProfileUserData> createState() => _ProfileUserDataState();
}

class _ProfileUserDataState extends State<ProfileUserData> {
  late User? user;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        String name = "";
        String email = "";
        state.maybeWhen(
          success: (data) {
            final user = data as User;
            name = user.name;
            email = user.email;
          },
          orElse: () {},
        );

        return Column(
          children: [
            Text(name, style: TextStyles.font20BlackRegular),
            Text(email, style: TextStyles.font14GrayNeutralRegular),
          ],
        );
      },
    );
  }
}
