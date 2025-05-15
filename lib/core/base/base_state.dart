import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState<T> with _$BaseState<T> {
  const factory BaseState.initial() = _Initial;
  const factory BaseState.loading() = Loading;
  const factory BaseState.success(T data) = Success<T>;
  const factory BaseState.error({required String error}) = Error;
}
