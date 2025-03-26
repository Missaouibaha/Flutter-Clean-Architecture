import '../../../../core/networking/api_result.dart';
import '../../data/models/login_request_body.dart';
import '../../data/models/login_response.dart';

abstract class LoginRepository {
  Future<ApiResult<LoginResponse>> login(String email, String password);
}
