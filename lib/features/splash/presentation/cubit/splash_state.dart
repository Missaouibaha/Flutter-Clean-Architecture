part of 'splash_cubit.dart';

@freezed
class SplashState<T> with _$SplashState<T> {
  const factory SplashState.initial() = _Initial;

  const factory SplashState.successCheckConnection(T data) =
      SuccessCheckConnection<T>;
  const factory SplashState.failureCheckConnection({required String error}) =
      FailureCheckConnection;
}
