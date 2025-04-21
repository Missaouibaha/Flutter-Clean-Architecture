part of 'splash_cubit.dart';

@freezed
class SplashState<T> with _$SplashState<T> {
  const factory SplashState.initial() = _Initial;

  const factory SplashState.successCheckStatus(T data) = SuccessCheckStatus<T>;
  const factory SplashState.failureCheckStatus({required String error}) =
      FailureCheckStatus;
}
