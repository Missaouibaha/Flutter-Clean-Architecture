import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/profile/data/datasources/remote/models/profile_response.dart';

abstract class ProfileRemoteDataSource {
  Future<ApiResult<ProfileResponse>> getProfile();
}
