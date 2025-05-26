import 'package:clean_arch_app/core/networking/api_constants.dart';
import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/search/data/datasources/local/local_data_source.dart';
import 'package:clean_arch_app/features/search/data/datasources/remote/remote_data_source.dart';
import 'package:clean_arch_app/features/search/data/mappers/search_doctor_mapper.dart';
import 'package:clean_arch_app/features/search/domain/entities/dotor_entity.dart';
import 'package:clean_arch_app/features/search/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  SearchRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<ApiResult<List<DoctorEntity>>> getDoctors() async {
    final localDoctors = await _localDataSource.getDoctors();

    if (localDoctors.isNotEmpty) {
       return ApiResult.success(
        localDoctors.map((doc) => doc.toDomain()).toList(),
      );
    }

    final token = await _localDataSource.getToken();
     final result = await _remoteDataSource.getDoctors(token);
     return result.when(
      success: (data) async {
        final docs = data.doctors;
        if (docs != null && docs.isNotEmpty) {
          await _localDataSource.saveDoctors(docs);
          return ApiResult.success(docs.map((doc) => doc.toDomain()).toList());
        } else {
          return ApiResult.failure(ErrorHandler.handle(ApiErrors.noContent));
        }
      },
      failure: (errorHandler) {
        return ApiResult.failure(errorHandler);
      },
    );
  }
}
