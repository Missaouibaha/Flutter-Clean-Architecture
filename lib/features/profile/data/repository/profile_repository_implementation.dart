import 'package:clean_arch_app/core/networking/api_constants.dart';
import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/profile/data/datasources/local/profile_local_data_source.dart';
import 'package:clean_arch_app/features/profile/data/datasources/remote/profile_remote_data_source.dart';
import 'package:clean_arch_app/features/profile/data/mappers/user_data_mapper.dart';
import 'package:clean_arch_app/features/profile/domain/entities/user.dart';
import 'package:clean_arch_app/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImplementation implements ProfileRepository {
  final ProfileLocalDataSource _profileLocalDataSource;
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepositoryImplementation(
    this._profileLocalDataSource,
    this._profileRemoteDataSource,
  );

  @override
  Future<ApiResult<User>> getProfile() async {
    var localUser = await _profileLocalDataSource.getCachedUser();
   
    if (localUser != null) {
      return ApiResult.success(localUser.toDomain());
    } else {
      final result = await _profileRemoteDataSource.getProfile();
      return result.when(
        success: (value) async {
          final userData = value.userData?.firstOrNull;
          if (userData != null) {
            await _profileLocalDataSource.cacheUser(userData);
            return ApiResult.success(userData.toDomain());
          } else {
            return ApiResult.failure(ErrorHandler.handle(ApiErrors.noContent));
          }
        },
        failure: (error) {
          return ApiResult.failure(ErrorHandler.handle(error));
        },
      );
    }
  }
}
