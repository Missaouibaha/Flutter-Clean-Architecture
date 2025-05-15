import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/features/splash/domain/repository/splash_repository.dart';
import 'package:dartz/dartz.dart';

class CheckUserConnectionUseCase {
  final SplashRepository splashRepository;
  CheckUserConnectionUseCase(this.splashRepository);

  Future<Either<ErrorHandler, bool>> call() async {
    return await splashRepository.isAuthenticated();
  }
}
