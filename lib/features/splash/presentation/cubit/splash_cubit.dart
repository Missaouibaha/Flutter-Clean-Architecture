import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/splash/domain/usecase/check_user_status_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final CheckUserStatusUseCase checkUserStatusUseCase;
  SplashCubit(this.checkUserStatusUseCase) : super(SplashState.initial());

  void emitCheckStatus() async {
    final isLoggedIn = await checkUserStatusUseCase.call();
    await Future.delayed(const Duration(seconds: 2));
    isLoggedIn.fold(
      (failure) {
        emit(
          SplashState.failureCheckStatus(
            error: failure.apiErrorModel.message ?? AppStrings.unknownError,
          ),
        );
      },
      (isLoggedIn) {
        emit(SplashState.successCheckStatus(isLoggedIn));
      },
    );
  }
}
