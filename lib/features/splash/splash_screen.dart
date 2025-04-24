import 'package:clean_arch_app/core/utils/app_assets.dart';
import 'package:clean_arch_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:clean_arch_app/features/splash/presentation/widget/splash_block_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => context.read<SplashCubit>()..emitCheckStatus(),

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.imageDocLogo),
                SplashBlockListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
