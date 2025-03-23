import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final SharedPreferences _prefs;
  final FlutterSecureStorage _flutterSecureStorage;

  SharedPreferencesHelper(this._prefs, this._flutterSecureStorage);

  Future<void> setData(String key, value) async {
    switch (value) {
      case String:
        await _prefs.setString(key, value);
        break;

      case int:
        await _prefs.setInt(key, value);
        break;

      case bool:
        await _prefs.setBool(key, value);
        break;

      case double:
        await _prefs.setDouble(key, value);
        break;

      default:
        return;
    }
  }

  /// Removes a value from SharedPreferences with given [key].
  Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    await _prefs.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    await _prefs.clear();
  }

  Future<T> getValue<T>(String key, T defaultValue) async {
    debugPrint('SharedPrefHelper : getValue<$T> with key : $key');

    final actions = {
      bool: _prefs.getBool,
      double: _prefs.getDouble,
      int: _prefs.getInt,
      String: _prefs.getString,
    };

    return (actions[T]?.call(key) as T?) ?? defaultValue;
  }

  Future<bool> getBool(String key) async {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    return _prefs.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  Future<double> getDouble(String key) async {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    return _prefs.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  Future<int> getInt(String key) async {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    return _prefs.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  Future<String> getString(String key) async {
    debugPrint('SharedPrefHelper : getString with key : $key');
    return _prefs.getString(key) ?? '';
  }

  // secure data
  Future<void> setSecureString(String key, String value) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

  Future<String> getSecureString(String key) async {
    return await _flutterSecureStorage.read(key: key) ?? "";
  }
}
