
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState<T> with _$SignUpState<T> {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loadingSignUp() = LoadingSignUp;
  const factory SignUpState.successSignUp(T data) = SuccessSignUp<T>;
  const factory SignUpState.errorSignUp({required String error}) = ErrorSignUp;
    const factory SignUpState.genderValidationError() = GenderValidationError;

}
