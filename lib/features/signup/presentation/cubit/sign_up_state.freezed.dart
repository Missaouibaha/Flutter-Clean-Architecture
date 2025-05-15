// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingSignUp,
    required TResult Function(T data) successSignUp,
    required TResult Function(String error) errorSignUp,
    required TResult Function() genderValidationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingSignUp,
    TResult? Function(T data)? successSignUp,
    TResult? Function(String error)? errorSignUp,
    TResult? Function()? genderValidationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSignUp,
    TResult Function(T data)? successSignUp,
    TResult Function(String error)? errorSignUp,
    TResult Function()? genderValidationError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(LoadingSignUp<T> value) loadingSignUp,
    required TResult Function(SuccessSignUp<T> value) successSignUp,
    required TResult Function(ErrorSignUp<T> value) errorSignUp,
    required TResult Function(GenderValidationError<T> value)
        genderValidationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(LoadingSignUp<T> value)? loadingSignUp,
    TResult? Function(SuccessSignUp<T> value)? successSignUp,
    TResult? Function(ErrorSignUp<T> value)? errorSignUp,
    TResult? Function(GenderValidationError<T> value)? genderValidationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(LoadingSignUp<T> value)? loadingSignUp,
    TResult Function(SuccessSignUp<T> value)? successSignUp,
    TResult Function(ErrorSignUp<T> value)? errorSignUp,
    TResult Function(GenderValidationError<T> value)? genderValidationError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<T, $Res> {
  factory $SignUpStateCopyWith(
          SignUpState<T> value, $Res Function(SignUpState<T>) then) =
      _$SignUpStateCopyWithImpl<T, $Res, SignUpState<T>>;
}

/// @nodoc
class _$SignUpStateCopyWithImpl<T, $Res, $Val extends SignUpState<T>>
    implements $SignUpStateCopyWith<T, $Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$SignUpStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SignUpState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingSignUp,
    required TResult Function(T data) successSignUp,
    required TResult Function(String error) errorSignUp,
    required TResult Function() genderValidationError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingSignUp,
    TResult? Function(T data)? successSignUp,
    TResult? Function(String error)? errorSignUp,
    TResult? Function()? genderValidationError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSignUp,
    TResult Function(T data)? successSignUp,
    TResult Function(String error)? errorSignUp,
    TResult Function()? genderValidationError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(LoadingSignUp<T> value) loadingSignUp,
    required TResult Function(SuccessSignUp<T> value) successSignUp,
    required TResult Function(ErrorSignUp<T> value) errorSignUp,
    required TResult Function(GenderValidationError<T> value)
        genderValidationError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(LoadingSignUp<T> value)? loadingSignUp,
    TResult? Function(SuccessSignUp<T> value)? successSignUp,
    TResult? Function(ErrorSignUp<T> value)? errorSignUp,
    TResult? Function(GenderValidationError<T> value)? genderValidationError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(LoadingSignUp<T> value)? loadingSignUp,
    TResult Function(SuccessSignUp<T> value)? successSignUp,
    TResult Function(ErrorSignUp<T> value)? errorSignUp,
    TResult Function(GenderValidationError<T> value)? genderValidationError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements SignUpState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$LoadingSignUpImplCopyWith<T, $Res> {
  factory _$$LoadingSignUpImplCopyWith(_$LoadingSignUpImpl<T> value,
          $Res Function(_$LoadingSignUpImpl<T>) then) =
      __$$LoadingSignUpImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingSignUpImplCopyWithImpl<T, $Res>
    extends _$SignUpStateCopyWithImpl<T, $Res, _$LoadingSignUpImpl<T>>
    implements _$$LoadingSignUpImplCopyWith<T, $Res> {
  __$$LoadingSignUpImplCopyWithImpl(_$LoadingSignUpImpl<T> _value,
      $Res Function(_$LoadingSignUpImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingSignUpImpl<T> implements LoadingSignUp<T> {
  const _$LoadingSignUpImpl();

  @override
  String toString() {
    return 'SignUpState<$T>.loadingSignUp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingSignUpImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingSignUp,
    required TResult Function(T data) successSignUp,
    required TResult Function(String error) errorSignUp,
    required TResult Function() genderValidationError,
  }) {
    return loadingSignUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingSignUp,
    TResult? Function(T data)? successSignUp,
    TResult? Function(String error)? errorSignUp,
    TResult? Function()? genderValidationError,
  }) {
    return loadingSignUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSignUp,
    TResult Function(T data)? successSignUp,
    TResult Function(String error)? errorSignUp,
    TResult Function()? genderValidationError,
    required TResult orElse(),
  }) {
    if (loadingSignUp != null) {
      return loadingSignUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(LoadingSignUp<T> value) loadingSignUp,
    required TResult Function(SuccessSignUp<T> value) successSignUp,
    required TResult Function(ErrorSignUp<T> value) errorSignUp,
    required TResult Function(GenderValidationError<T> value)
        genderValidationError,
  }) {
    return loadingSignUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(LoadingSignUp<T> value)? loadingSignUp,
    TResult? Function(SuccessSignUp<T> value)? successSignUp,
    TResult? Function(ErrorSignUp<T> value)? errorSignUp,
    TResult? Function(GenderValidationError<T> value)? genderValidationError,
  }) {
    return loadingSignUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(LoadingSignUp<T> value)? loadingSignUp,
    TResult Function(SuccessSignUp<T> value)? successSignUp,
    TResult Function(ErrorSignUp<T> value)? errorSignUp,
    TResult Function(GenderValidationError<T> value)? genderValidationError,
    required TResult orElse(),
  }) {
    if (loadingSignUp != null) {
      return loadingSignUp(this);
    }
    return orElse();
  }
}

abstract class LoadingSignUp<T> implements SignUpState<T> {
  const factory LoadingSignUp() = _$LoadingSignUpImpl<T>;
}

/// @nodoc
abstract class _$$SuccessSignUpImplCopyWith<T, $Res> {
  factory _$$SuccessSignUpImplCopyWith(_$SuccessSignUpImpl<T> value,
          $Res Function(_$SuccessSignUpImpl<T>) then) =
      __$$SuccessSignUpImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessSignUpImplCopyWithImpl<T, $Res>
    extends _$SignUpStateCopyWithImpl<T, $Res, _$SuccessSignUpImpl<T>>
    implements _$$SuccessSignUpImplCopyWith<T, $Res> {
  __$$SuccessSignUpImplCopyWithImpl(_$SuccessSignUpImpl<T> _value,
      $Res Function(_$SuccessSignUpImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessSignUpImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessSignUpImpl<T> implements SuccessSignUp<T> {
  const _$SuccessSignUpImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'SignUpState<$T>.successSignUp(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessSignUpImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessSignUpImplCopyWith<T, _$SuccessSignUpImpl<T>> get copyWith =>
      __$$SuccessSignUpImplCopyWithImpl<T, _$SuccessSignUpImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingSignUp,
    required TResult Function(T data) successSignUp,
    required TResult Function(String error) errorSignUp,
    required TResult Function() genderValidationError,
  }) {
    return successSignUp(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingSignUp,
    TResult? Function(T data)? successSignUp,
    TResult? Function(String error)? errorSignUp,
    TResult? Function()? genderValidationError,
  }) {
    return successSignUp?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSignUp,
    TResult Function(T data)? successSignUp,
    TResult Function(String error)? errorSignUp,
    TResult Function()? genderValidationError,
    required TResult orElse(),
  }) {
    if (successSignUp != null) {
      return successSignUp(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(LoadingSignUp<T> value) loadingSignUp,
    required TResult Function(SuccessSignUp<T> value) successSignUp,
    required TResult Function(ErrorSignUp<T> value) errorSignUp,
    required TResult Function(GenderValidationError<T> value)
        genderValidationError,
  }) {
    return successSignUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(LoadingSignUp<T> value)? loadingSignUp,
    TResult? Function(SuccessSignUp<T> value)? successSignUp,
    TResult? Function(ErrorSignUp<T> value)? errorSignUp,
    TResult? Function(GenderValidationError<T> value)? genderValidationError,
  }) {
    return successSignUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(LoadingSignUp<T> value)? loadingSignUp,
    TResult Function(SuccessSignUp<T> value)? successSignUp,
    TResult Function(ErrorSignUp<T> value)? errorSignUp,
    TResult Function(GenderValidationError<T> value)? genderValidationError,
    required TResult orElse(),
  }) {
    if (successSignUp != null) {
      return successSignUp(this);
    }
    return orElse();
  }
}

abstract class SuccessSignUp<T> implements SignUpState<T> {
  const factory SuccessSignUp(final T data) = _$SuccessSignUpImpl<T>;

  T get data;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessSignUpImplCopyWith<T, _$SuccessSignUpImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorSignUpImplCopyWith<T, $Res> {
  factory _$$ErrorSignUpImplCopyWith(_$ErrorSignUpImpl<T> value,
          $Res Function(_$ErrorSignUpImpl<T>) then) =
      __$$ErrorSignUpImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorSignUpImplCopyWithImpl<T, $Res>
    extends _$SignUpStateCopyWithImpl<T, $Res, _$ErrorSignUpImpl<T>>
    implements _$$ErrorSignUpImplCopyWith<T, $Res> {
  __$$ErrorSignUpImplCopyWithImpl(
      _$ErrorSignUpImpl<T> _value, $Res Function(_$ErrorSignUpImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorSignUpImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorSignUpImpl<T> implements ErrorSignUp<T> {
  const _$ErrorSignUpImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'SignUpState<$T>.errorSignUp(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorSignUpImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorSignUpImplCopyWith<T, _$ErrorSignUpImpl<T>> get copyWith =>
      __$$ErrorSignUpImplCopyWithImpl<T, _$ErrorSignUpImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingSignUp,
    required TResult Function(T data) successSignUp,
    required TResult Function(String error) errorSignUp,
    required TResult Function() genderValidationError,
  }) {
    return errorSignUp(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingSignUp,
    TResult? Function(T data)? successSignUp,
    TResult? Function(String error)? errorSignUp,
    TResult? Function()? genderValidationError,
  }) {
    return errorSignUp?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSignUp,
    TResult Function(T data)? successSignUp,
    TResult Function(String error)? errorSignUp,
    TResult Function()? genderValidationError,
    required TResult orElse(),
  }) {
    if (errorSignUp != null) {
      return errorSignUp(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(LoadingSignUp<T> value) loadingSignUp,
    required TResult Function(SuccessSignUp<T> value) successSignUp,
    required TResult Function(ErrorSignUp<T> value) errorSignUp,
    required TResult Function(GenderValidationError<T> value)
        genderValidationError,
  }) {
    return errorSignUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(LoadingSignUp<T> value)? loadingSignUp,
    TResult? Function(SuccessSignUp<T> value)? successSignUp,
    TResult? Function(ErrorSignUp<T> value)? errorSignUp,
    TResult? Function(GenderValidationError<T> value)? genderValidationError,
  }) {
    return errorSignUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(LoadingSignUp<T> value)? loadingSignUp,
    TResult Function(SuccessSignUp<T> value)? successSignUp,
    TResult Function(ErrorSignUp<T> value)? errorSignUp,
    TResult Function(GenderValidationError<T> value)? genderValidationError,
    required TResult orElse(),
  }) {
    if (errorSignUp != null) {
      return errorSignUp(this);
    }
    return orElse();
  }
}

abstract class ErrorSignUp<T> implements SignUpState<T> {
  const factory ErrorSignUp({required final String error}) =
      _$ErrorSignUpImpl<T>;

  String get error;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorSignUpImplCopyWith<T, _$ErrorSignUpImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenderValidationErrorImplCopyWith<T, $Res> {
  factory _$$GenderValidationErrorImplCopyWith(
          _$GenderValidationErrorImpl<T> value,
          $Res Function(_$GenderValidationErrorImpl<T>) then) =
      __$$GenderValidationErrorImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$GenderValidationErrorImplCopyWithImpl<T, $Res>
    extends _$SignUpStateCopyWithImpl<T, $Res, _$GenderValidationErrorImpl<T>>
    implements _$$GenderValidationErrorImplCopyWith<T, $Res> {
  __$$GenderValidationErrorImplCopyWithImpl(
      _$GenderValidationErrorImpl<T> _value,
      $Res Function(_$GenderValidationErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GenderValidationErrorImpl<T> implements GenderValidationError<T> {
  const _$GenderValidationErrorImpl();

  @override
  String toString() {
    return 'SignUpState<$T>.genderValidationError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenderValidationErrorImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingSignUp,
    required TResult Function(T data) successSignUp,
    required TResult Function(String error) errorSignUp,
    required TResult Function() genderValidationError,
  }) {
    return genderValidationError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingSignUp,
    TResult? Function(T data)? successSignUp,
    TResult? Function(String error)? errorSignUp,
    TResult? Function()? genderValidationError,
  }) {
    return genderValidationError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSignUp,
    TResult Function(T data)? successSignUp,
    TResult Function(String error)? errorSignUp,
    TResult Function()? genderValidationError,
    required TResult orElse(),
  }) {
    if (genderValidationError != null) {
      return genderValidationError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(LoadingSignUp<T> value) loadingSignUp,
    required TResult Function(SuccessSignUp<T> value) successSignUp,
    required TResult Function(ErrorSignUp<T> value) errorSignUp,
    required TResult Function(GenderValidationError<T> value)
        genderValidationError,
  }) {
    return genderValidationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(LoadingSignUp<T> value)? loadingSignUp,
    TResult? Function(SuccessSignUp<T> value)? successSignUp,
    TResult? Function(ErrorSignUp<T> value)? errorSignUp,
    TResult? Function(GenderValidationError<T> value)? genderValidationError,
  }) {
    return genderValidationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(LoadingSignUp<T> value)? loadingSignUp,
    TResult Function(SuccessSignUp<T> value)? successSignUp,
    TResult Function(ErrorSignUp<T> value)? errorSignUp,
    TResult Function(GenderValidationError<T> value)? genderValidationError,
    required TResult orElse(),
  }) {
    if (genderValidationError != null) {
      return genderValidationError(this);
    }
    return orElse();
  }
}

abstract class GenderValidationError<T> implements SignUpState<T> {
  const factory GenderValidationError() = _$GenderValidationErrorImpl<T>;
}
