import 'package:clean_arch_app/core/helper/local/shared_preferences_helper.dart';
import 'package:clean_arch_app/core/helper/local/shared_preferences_keys.dart';
import 'package:clean_arch_app/core/networking/api_constants.dart';
import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/login/data/datasources/local/login_local_data_source.dart';
import 'package:clean_arch_app/features/login/data/datasources/remote/login_remote_data_source.dart';
import 'package:clean_arch_app/features/login/data/mappers/user_data_mapper.dart';
import 'package:clean_arch_app/features/login/domain/entities/user.dart';
import 'package:clean_arch_app/features/login/domain/repository/login_repository.dart';

class LoginRepositoryImplementation implements LoginRepository {
  final LoginRemoteDataSource _remoteDataSource;
  final LoginLocalDataSource _localDataSource;

  LoginRepositoryImplementation(
    this._localDataSource,
    this._remoteDataSource,
  );

  @override
  Future<ApiResult<User>> login(String email, String password) async {
    try {
      final response = await _remoteDataSource.login(email, password);

      return response.when(
        success: (data) async {
          final user = data.userData;
          if (user != null) {
            await _localDataSource.cacheUser(user);
            return ApiResult.success(user.toDomain());
          } else {
            return ApiResult.failure(ErrorHandler.handle(ApiErrors.noContent));
          }
        },
        failure: (errorHandler) {
          return ApiResult.failure(errorHandler);
        },
      );
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
