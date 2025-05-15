import 'package:clean_arch_app/core/base/base_remote_data_source.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/profile/data/datasources/remote/models/profile_response.dart';
import 'package:clean_arch_app/features/profile/data/datasources/remote/profile_remote_data_source.dart';

class ProfileRemoteDataSourceImpl extends BaseRemoteDataSource
    implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl();

  @override
  Future<ApiResult<ProfileResponse>> getProfile(String token) async {
    return safeApiCall(() async {
      return await apiService.getProfile("Bearer $token");
    });
  }
}
