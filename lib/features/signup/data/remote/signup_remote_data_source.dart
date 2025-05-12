import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/signup/data/remote/models/signup_request_body.dart';
import 'package:clean_arch_app/features/signup/data/remote/models/signup_response.dart';

abstract class SignupRemoteDataSource {
  Future<ApiResult<SignUpResponse>> signup(SignupRequestBody signupRequestBody);
}
