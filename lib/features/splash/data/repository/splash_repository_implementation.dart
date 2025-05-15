import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/features/splash/data/datasources/local/splash_local_data_source.dart';
import 'package:clean_arch_app/features/splash/domain/repository/splash_repository.dart';
import 'package:dartz/dartz.dart';

class SplashRepositoryImplementation implements SplashRepository {
  final SplashLocalDataSource _splashLocalDataSource;

  SplashRepositoryImplementation(this._splashLocalDataSource);

  @override
  Future<Either<ErrorHandler, bool>> isAuthenticated() async {
    return await _splashLocalDataSource.isConnected();
  }
}
