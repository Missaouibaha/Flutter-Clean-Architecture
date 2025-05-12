import 'package:clean_arch_app/core/widgets/error_dialog.dart';
import 'package:clean_arch_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:clean_arch_app/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlocListener extends StatelessWidget {
  final Function(bool) onLoadingChanged;

  const HomeBlocListener({super.key, required this.onLoadingChanged});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        state.whenOrNull(
          homeLoading: (data) => onLoadingChanged(false),
          homeLoaded: (data) => onLoadingChanged(true),
          homeError: (error, data) {
            onLoadingChanged(false);
            if (data.homeData == null) {
              ErrorDialog.show(context, error);
            }
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
