import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/networking/api_error_model.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/signup/domain/usecases/sign_up_use_case.dart';
import 'package:clean_arch_app/features/signup/presentation/cubit/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;
  SignUpCubit(this.signUpUseCase) : super(SignUpState.initial());

  void emitSignupStates(
    String name,
    String email,
    String phone,
    String password,
    String confirmPassword,
    String gender,
  ) async {
    if (gender.isNullOrEmpty) {
      emit(SignUpState.genderValidationError());
      return;
    }

    emit(SignUpState.loadingSignUp());

    final result = await signUpUseCase.call(
      name,
      email,
      phone,
      password,
      confirmPassword,
      gender,
    );

    result.when(
      success: (response) => emit(SignUpState.successSignUp(response)),
      failure: (error) {
        String errorMessage = _extractErrorMessage(error.apiErrorModel);
        emit(SignUpState.errorSignUp(error: errorMessage));
      },
    );
  }

  String _extractErrorMessage(ApiErrorModel errorResponse) {
    if (errorResponse.errors != null) {
      var firstError = errorResponse.errors!.values.first;
      if (firstError is List && firstError.isNotEmpty) {
        return firstError.first.toString();
      }
    }
    return errorResponse.message ?? AppStrings.unknownError;
  }
}
