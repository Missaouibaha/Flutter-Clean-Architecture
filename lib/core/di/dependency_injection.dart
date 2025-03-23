import 'package:clean_arch_app/core/helper/local/shared_preferences_helper.dart';
import 'package:clean_arch_app/core/networking/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  //Dio &Api Service
  Dio dio = DioFactory.getDio();

  //init SharedPreferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // init securestorage
  FlutterSecureStorage flutterSecureStorage = await FlutterSecureStorage();
  getIt.registerLazySingleton<FlutterSecureStorage>(() => flutterSecureStorage);

  // SharedPreferences Helper byinject sharedpref and secure storage
  getIt.registerLazySingleton<SharedPreferencesHelper>(
    () => SharedPreferencesHelper(getIt(), getIt()),
  );

  //initApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
}
