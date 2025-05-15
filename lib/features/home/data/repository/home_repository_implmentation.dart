import 'package:clean_arch_app/core/networking/api_constants.dart';
import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/home/data/datasources/local/home_local_data_source.dart';
import 'package:clean_arch_app/features/home/data/datasources/mappers/home_data_mapper.dart';
import 'package:clean_arch_app/features/home/data/datasources/mappers/user_local_mapper.dart';
import 'package:clean_arch_app/features/home/data/datasources/remote/home_remote_data_source.dart';
import 'package:clean_arch_app/features/home/domain/entities/home_data_entity.dart';
import 'package:clean_arch_app/features/home/domain/entities/user.dart';
import 'package:clean_arch_app/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImplmentation implements HomeRepository {
  final HomeLocalDataSource _localDataSource;
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImplmentation(this._localDataSource, this._remoteDataSource);

  @override
  Future<ApiResult<List<HomeDataEntity>>> getHomeData() async {
    var localHomeData = await _localDataSource.getCachedHomeData();

    if (localHomeData!.isNotEmpty) {
      return ApiResult.success(
        localHomeData.map((localData) => localData.toDomain()).toList(),
      );
    } else {
      final token = await _localDataSource.getToken();
      final result = await _remoteDataSource.getHomeData(token);
      return result.when(
        success: (data) async {
          final homeData = data.homeData;
          if (homeData != null) {
            await _localDataSource.cacheHomeData(homeData);
            return ApiResult.success(
              homeData.map((data) => data.toDomain()).toList(),
            );
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

  @override
  Future<User?> getConnectedUser() async {
    var userLocal = await _localDataSource.getCachedUser();
    return userLocal?.toDomain();
  }
}
