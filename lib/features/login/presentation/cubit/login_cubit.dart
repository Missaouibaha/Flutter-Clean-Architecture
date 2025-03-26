import 'package:bloc/bloc.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/login/domain/usecases/login_use_case.dart';
import 'package:clean_arch_app/features/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(const LoginState.initial());

  void emitLoginStates(String email, String password) async {
    emit(const LoginState.loading());
    final response = await loginUseCase(email, password);

    response.when(
      success: (user) {
        emit(LoginState.success(user));
      },
      failure: (error) {
        emit(
          LoginState.error(
            error: error.apiErrorModel.message ?? AppStrings.unknownError,
          ),
        );
      },
    );
  }
}
