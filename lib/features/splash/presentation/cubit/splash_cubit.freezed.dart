// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SplashState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T data) successCheckStatus,
    required TResult Function(String error) failureCheckStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T data)? successCheckStatus,
    TResult? Function(String error)? failureCheckStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T data)? successCheckStatus,
    TResult Function(String error)? failureCheckStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SuccessCheckStatus<T> value) successCheckStatus,
    required TResult Function(FailureCheckStatus<T> value) failureCheckStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SuccessCheckStatus<T> value)? successCheckStatus,
    TResult? Function(FailureCheckStatus<T> value)? failureCheckStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SuccessCheckStatus<T> value)? successCheckStatus,
    TResult Function(FailureCheckStatus<T> value)? failureCheckStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<T, $Res> {
  factory $SplashStateCopyWith(
    SplashState<T> value,
    $Res Function(SplashState<T>) then,
  ) = _$SplashStateCopyWithImpl<T, $Res, SplashState<T>>;
}

/// @nodoc
class _$SplashStateCopyWithImpl<T, $Res, $Val extends SplashState<T>>
    implements $SplashStateCopyWith<T, $Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl<T> value,
    $Res Function(_$InitialImpl<T>) then,
  ) = __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$SplashStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl<T> _value,
    $Res Function(_$InitialImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SplashState<$T>.initial()';
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
    required TResult Function(T data) successCheckStatus,
    required TResult Function(String error) failureCheckStatus,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T data)? successCheckStatus,
    TResult? Function(String error)? failureCheckStatus,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T data)? successCheckStatus,
    TResult Function(String error)? failureCheckStatus,
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
    required TResult Function(SuccessCheckStatus<T> value) successCheckStatus,
    required TResult Function(FailureCheckStatus<T> value) failureCheckStatus,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SuccessCheckStatus<T> value)? successCheckStatus,
    TResult? Function(FailureCheckStatus<T> value)? failureCheckStatus,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SuccessCheckStatus<T> value)? successCheckStatus,
    TResult Function(FailureCheckStatus<T> value)? failureCheckStatus,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements SplashState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$SuccessCheckStatusImplCopyWith<T, $Res> {
  factory _$$SuccessCheckStatusImplCopyWith(
    _$SuccessCheckStatusImpl<T> value,
    $Res Function(_$SuccessCheckStatusImpl<T>) then,
  ) = __$$SuccessCheckStatusImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessCheckStatusImplCopyWithImpl<T, $Res>
    extends _$SplashStateCopyWithImpl<T, $Res, _$SuccessCheckStatusImpl<T>>
    implements _$$SuccessCheckStatusImplCopyWith<T, $Res> {
  __$$SuccessCheckStatusImplCopyWithImpl(
    _$SuccessCheckStatusImpl<T> _value,
    $Res Function(_$SuccessCheckStatusImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$SuccessCheckStatusImpl<T>(
        freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                as T,
      ),
    );
  }
}

/// @nodoc

class _$SuccessCheckStatusImpl<T> implements SuccessCheckStatus<T> {
  const _$SuccessCheckStatusImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'SplashState<$T>.successCheckStatus(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessCheckStatusImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessCheckStatusImplCopyWith<T, _$SuccessCheckStatusImpl<T>>
  get copyWith =>
      __$$SuccessCheckStatusImplCopyWithImpl<T, _$SuccessCheckStatusImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T data) successCheckStatus,
    required TResult Function(String error) failureCheckStatus,
  }) {
    return successCheckStatus(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T data)? successCheckStatus,
    TResult? Function(String error)? failureCheckStatus,
  }) {
    return successCheckStatus?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T data)? successCheckStatus,
    TResult Function(String error)? failureCheckStatus,
    required TResult orElse(),
  }) {
    if (successCheckStatus != null) {
      return successCheckStatus(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SuccessCheckStatus<T> value) successCheckStatus,
    required TResult Function(FailureCheckStatus<T> value) failureCheckStatus,
  }) {
    return successCheckStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SuccessCheckStatus<T> value)? successCheckStatus,
    TResult? Function(FailureCheckStatus<T> value)? failureCheckStatus,
  }) {
    return successCheckStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SuccessCheckStatus<T> value)? successCheckStatus,
    TResult Function(FailureCheckStatus<T> value)? failureCheckStatus,
    required TResult orElse(),
  }) {
    if (successCheckStatus != null) {
      return successCheckStatus(this);
    }
    return orElse();
  }
}

abstract class SuccessCheckStatus<T> implements SplashState<T> {
  const factory SuccessCheckStatus(final T data) = _$SuccessCheckStatusImpl<T>;

  T get data;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessCheckStatusImplCopyWith<T, _$SuccessCheckStatusImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureCheckStatusImplCopyWith<T, $Res> {
  factory _$$FailureCheckStatusImplCopyWith(
    _$FailureCheckStatusImpl<T> value,
    $Res Function(_$FailureCheckStatusImpl<T>) then,
  ) = __$$FailureCheckStatusImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FailureCheckStatusImplCopyWithImpl<T, $Res>
    extends _$SplashStateCopyWithImpl<T, $Res, _$FailureCheckStatusImpl<T>>
    implements _$$FailureCheckStatusImplCopyWith<T, $Res> {
  __$$FailureCheckStatusImplCopyWithImpl(
    _$FailureCheckStatusImpl<T> _value,
    $Res Function(_$FailureCheckStatusImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$FailureCheckStatusImpl<T>(
        error:
            null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$FailureCheckStatusImpl<T> implements FailureCheckStatus<T> {
  const _$FailureCheckStatusImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'SplashState<$T>.failureCheckStatus(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureCheckStatusImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureCheckStatusImplCopyWith<T, _$FailureCheckStatusImpl<T>>
  get copyWith =>
      __$$FailureCheckStatusImplCopyWithImpl<T, _$FailureCheckStatusImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T data) successCheckStatus,
    required TResult Function(String error) failureCheckStatus,
  }) {
    return failureCheckStatus(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T data)? successCheckStatus,
    TResult? Function(String error)? failureCheckStatus,
  }) {
    return failureCheckStatus?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T data)? successCheckStatus,
    TResult Function(String error)? failureCheckStatus,
    required TResult orElse(),
  }) {
    if (failureCheckStatus != null) {
      return failureCheckStatus(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SuccessCheckStatus<T> value) successCheckStatus,
    required TResult Function(FailureCheckStatus<T> value) failureCheckStatus,
  }) {
    return failureCheckStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SuccessCheckStatus<T> value)? successCheckStatus,
    TResult? Function(FailureCheckStatus<T> value)? failureCheckStatus,
  }) {
    return failureCheckStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SuccessCheckStatus<T> value)? successCheckStatus,
    TResult Function(FailureCheckStatus<T> value)? failureCheckStatus,
    required TResult orElse(),
  }) {
    if (failureCheckStatus != null) {
      return failureCheckStatus(this);
    }
    return orElse();
  }
}

abstract class FailureCheckStatus<T> implements SplashState<T> {
  const factory FailureCheckStatus({required final String error}) =
      _$FailureCheckStatusImpl<T>;

  String get error;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureCheckStatusImplCopyWith<T, _$FailureCheckStatusImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}
