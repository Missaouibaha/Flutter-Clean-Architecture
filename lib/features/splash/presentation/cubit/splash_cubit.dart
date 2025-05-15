import 'package:clean_arch_app/core/utils/app_consts.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/splash/domain/usecase/check_user_connection_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final CheckUserConnectionUseCase checkUserConnectionUseCase;
  SplashCubit(this.checkUserConnectionUseCase) : super(SplashState.initial());

  void emitCheckConnectionStates() async {
    final isLoggedIn = await checkUserConnectionUseCase.call();
    await Future.delayed(const Duration(seconds: AppConsts.splashDelay));
    isLoggedIn.fold(
      (failure) {
        emit(
          SplashState.failureCheckConnection(
            error: failure.apiErrorModel.message ?? AppStrings.unknownError,
          ),
        );
      },
      (isLoggedIn) {
        emit(SplashState.successCheckConnection(isLoggedIn));
      },
    );
  }
}
