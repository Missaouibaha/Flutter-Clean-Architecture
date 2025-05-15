import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/profile/domain/entities/user.dart';

abstract class ProfileRepository {
  Future<ApiResult<User>> getProfile();
}
