import 'package:flutter/material.dart';

extension NullableExtensions<T> on T? {
  R? let<R>(R Function(T it) block) {
    final self = this;
    if (self != null) {
      return block(self);
    }
    return null;
  }
}

extension NullableOrDefaultExtensions<T> on T? {
  T orDefault(T defaultValue) => this ?? defaultValue;
}

extension StringExtensions on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

extension Regex on String {
  String? isValidateEmail() {
    if (isEmpty) {
      return "Enter your Email";
    } else if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(this)) {
      return "Enter a valid Email adress";
    }
    return null;
  }
}

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}
