import 'package:clean_arch_app/core/helper/local/shared_preferences_helper.dart';
import 'package:clean_arch_app/core/networking/api_service.dart';
import 'package:clean_arch_app/features/login/data/repository/login_repository_implementation.dart';
import 'package:clean_arch_app/features/login/domain/repository/login_repository.dart';
import 'package:clean_arch_app/features/login/domain/usecases/login_use_case.dart';
import 'package:clean_arch_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:clean_arch_app/features/profile/data/repository/profile_repository_implementation.dart';
import 'package:clean_arch_app/features/profile/domain/repository/profile_repository.dart';
import 'package:clean_arch_app/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:clean_arch_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:clean_arch_app/features/setting/data/repository/setting_repository_implementation.dart';
import 'package:clean_arch_app/features/setting/domain/repository/setting_repository.dart';
import 'package:clean_arch_app/features/setting/domain/usecases/setting_use_case.dart';
import 'package:clean_arch_app/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:clean_arch_app/features/signup/data/repository/sign_up_repository_imp.dart';
import 'package:clean_arch_app/features/signup/domain/repositpry/sign_up_repository.dart';
import 'package:clean_arch_app/features/signup/domain/usecases/sign_up_use_case.dart';
import 'package:clean_arch_app/features/signup/presentation/cubit/sign_up_cubit.dart';
import 'package:clean_arch_app/features/splash/data/repository/splash_repository_implementation.dart';
import 'package:clean_arch_app/features/splash/domain/repository/splash_repository.dart';
import 'package:clean_arch_app/features/splash/domain/usecase/check_user_status_use_case.dart';
import 'package:clean_arch_app/features/splash/presentation/cubit/splash_cubit.dart';
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

  //Splash
  getIt.registerLazySingleton<SplashRepository>(
    () => SplashRepositoryImplementation(getIt()),
  );
  getIt.registerLazySingleton<CheckUserStatusUseCase>(
    () => CheckUserStatusUseCase(getIt()),
  );
  getIt.registerLazySingleton<SplashCubit>(() => SplashCubit(getIt()));

  //login
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImplementation(getIt(), getIt()),
  );
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //signup
  getIt.registerLazySingleton<SignUpRepository>(
    () => SignUpRepositoryImp(getIt(), getIt()),
  );
  getIt.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  //profile
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImplementation(getIt(), getIt()),
  );
  getIt.registerLazySingleton<GetProfileUseCase>(
    () => GetProfileUseCase(getIt()),
  );
  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(getIt()));

  //setting
  getIt.registerLazySingleton<SettingRepository>(
    () => SettingRepositoryImplementation(getIt()),
  );
  getIt.registerLazySingleton<SettingUseCase>(() => SettingUseCase(getIt()));
  getIt.registerFactory<SettingCubit>(() => SettingCubit(getIt()));
}
