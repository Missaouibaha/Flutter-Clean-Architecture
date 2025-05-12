import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/login/data/datasources/remote/models/login_response.dart';

abstract class LoginRemoteDataSource {
  Future<ApiResult<LoginResponse>> login(String email, String password);
}
