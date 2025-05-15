import 'package:clean_arch_app/core/helper/local/shared_preferences_helper.dart';
import 'package:clean_arch_app/core/helper/local/shared_preferences_keys.dart';
import 'package:clean_arch_app/core/services/hive/hive_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class BaseLocalDataSource {
  final HiveService? hive = GetIt.I<HiveService>();
  final SharedPreferencesHelper? prefs = GetIt.I<SharedPreferencesHelper>();

  Future<T?> getCached<T>(String boxKey, String objectKey) async {
    return await hive?.openAndGet<T>(boxKey, objectKey);
  }

  Future cache<T>(String boxKey, String objectKey, T data) async {
    await hive?.openAndPut(boxKey, objectKey, data);
  }

  Future clearDataAndLogout() async {
    try {
      await hive?.clear();
      await prefs?.clearAllData();
    } catch (error) {
      debugPrint('Logout error: $error');
    }
  }

  Future<void> cacheUserToken(String token) async {
    try {
      await prefs?.setSecureString(SharedPreferencesKeys.token, token);
      await prefs?.setData(SharedPreferencesKeys.isConnected, true);
    } catch (error) {
      debugPrint('Save token error: $error');
    }
  }

  Future<String> getUserToken() async {
    try {
      return await prefs!.getSecureString(SharedPreferencesKeys.token);
    } catch (error) {
      debugPrint('get token error: $error');
      return "";
    }
  }
}
