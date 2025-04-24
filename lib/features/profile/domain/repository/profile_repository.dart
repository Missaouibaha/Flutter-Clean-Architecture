import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/profile/data/models/profile_response.dart';

abstract class ProfileRepository {
  Future<ApiResult<ProfileResponse>> getProfile();
}
