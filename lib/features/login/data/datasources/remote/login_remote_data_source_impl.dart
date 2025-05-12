import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/core/networking/api_service.dart';
import 'package:clean_arch_app/features/login/data/datasources/remote/login_remote_data_source.dart';
import 'package:clean_arch_app/features/login/data/datasources/remote/models/login_request_body.dart';
import 'package:clean_arch_app/features/login/data/datasources/remote/models/login_response.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiService _apiService;

  LoginRemoteDataSourceImpl(this._apiService);
  @override
  Future<ApiResult<LoginResponse>> login(String email, String password) async {
    try {
      final response = await _apiService.login(
        LoginRequestBody(email: email, password: password),
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
