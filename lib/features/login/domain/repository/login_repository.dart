import 'package:clean_arch_app/features/login/domain/entities/user.dart';

import '../../../../core/networking/api_result.dart';

abstract class LoginRepository {
  Future<ApiResult<User>> login(String email, String password);
}
