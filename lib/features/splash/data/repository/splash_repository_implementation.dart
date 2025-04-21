import 'package:clean_arch_app/core/helper/local/shared_preferences_helper.dart';
import 'package:clean_arch_app/core/helper/local/shared_preferences_keys.dart';
import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/features/splash/domain/repository/splash_repository.dart';
import 'package:dartz/dartz.dart';

class SplashRepositoryImplementation implements SplashRepository {
  final SharedPreferencesHelper sharedPreferencesHelper;
  SplashRepositoryImplementation(this.sharedPreferencesHelper);

  @override
  Future<Either<ErrorHandler, bool>> checkUserStatus() async {
    try {
      final isLoggedIn = await sharedPreferencesHelper.getValue(
        SharedPreferencesKeys.isConnected,
        false,
      );
      return Right(isLoggedIn);
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}
