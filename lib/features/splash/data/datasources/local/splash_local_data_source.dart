import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:dartz/dartz.dart';

abstract class SplashLocalDataSource {
  Future<Either<ErrorHandler, bool>> isConnected();
}
