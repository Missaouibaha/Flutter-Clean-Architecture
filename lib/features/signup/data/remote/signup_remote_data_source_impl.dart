import 'package:clean_arch_app/core/base/base_remote_data_source.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/signup/data/remote/models/signup_request_body.dart';
import 'package:clean_arch_app/features/signup/data/remote/models/signup_response.dart';
import 'package:clean_arch_app/features/signup/data/remote/signup_remote_data_source.dart';

class SignupRemoteDataSourceImpl extends BaseRemoteDataSource
    implements SignupRemoteDataSource {
  SignupRemoteDataSourceImpl();
  @override
  Future<ApiResult<SignUpResponse>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    return safeApiCall(() async {
      return await apiService.signUp(signupRequestBody);
    });
  }
}
