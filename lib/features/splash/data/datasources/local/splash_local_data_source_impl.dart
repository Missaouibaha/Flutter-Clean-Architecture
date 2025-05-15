import 'package:clean_arch_app/core/base/base_local_data_source.dart';
import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/helper/local/shared_preferences_keys.dart';
import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/features/splash/data/datasources/local/splash_local_data_source.dart';
import 'package:dartz/dartz.dart';

class SplashLocalDataSourceImpl extends BaseLocalDataSource
    implements SplashLocalDataSource {
  @override
  Future<Either<ErrorHandler, bool>> isConnected() async {
    try {
      final isLoggedIn =
          await prefs?.getValue(SharedPreferencesKeys.isConnected, false) ??
          false;
      final token = await prefs?.getSecureString(SharedPreferencesKeys.token);
      return Right(isLoggedIn && !token.isNullOrEmpty);
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}
