import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/core/networking/api_service.dart';
import 'package:clean_arch_app/features/signup/data/remote/models/signup_request_body.dart';
import 'package:clean_arch_app/features/signup/data/remote/models/signup_response.dart';
import 'package:clean_arch_app/features/signup/data/remote/signup_remote_data_source.dart';

class SignupRemoteDataSourceImpl implements SignupRemoteDataSource {
  final ApiService _apiService;

  SignupRemoteDataSourceImpl(this._apiService);
  @override
  Future<ApiResult<SignUpResponse>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await _apiService.signUp(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
