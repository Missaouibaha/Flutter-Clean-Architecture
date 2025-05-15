import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/signup/domain/entities/user.dart';

abstract class SignUpRepository {
  Future<ApiResult<bool>> signUp(User user);
}
