import 'package:clean_arch_app/core/helper/local/shared_preferences_helper.dart';
import 'package:clean_arch_app/core/networking/api_service.dart';
import 'package:clean_arch_app/features/login/data/repository/login_repository_implementation.dart';
import 'package:clean_arch_app/features/login/domain/repository/login_repository.dart';
import 'package:clean_arch_app/features/login/domain/usecases/login_use_case.dart';
import 'package:clean_arch_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:clean_arch_app/features/signup/data/repository/sign_up_repository_imp.dart';
import 'package:clean_arch_app/features/signup/domain/repositpry/sign_up_repository.dart';
import 'package:clean_arch_app/features/signup/domain/usecases/sign_up_use_case.dart';
import 'package:clean_arch_app/features/signup/presentation/cubit/sign_up_cubit.dart';
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

  //login
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImplementation(getIt(), getIt()),
  );
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  //signup
  getIt.registerLazySingleton<SignUpRepository>(
    () => SignUpRepositoryImp(getIt(), getIt()),
  );
  getIt.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
}
