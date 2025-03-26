import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/helper/local/shared_preferences_helper.dart';
import 'package:clean_arch_app/core/helper/local/shared_preferences_keys.dart';
import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/core/networking/api_service.dart';
import 'package:clean_arch_app/features/login/data/models/login_request_body.dart';
import 'package:clean_arch_app/features/login/data/models/login_response.dart';
import 'package:clean_arch_app/features/login/domain/repository/login_repository.dart';

class LoginRepositoryImplementation implements LoginRepository {
  final ApiService _apiService;
  final SharedPreferencesHelper _sharedPreferencesHelper;
  LoginRepositoryImplementation(
    this._apiService,
    this._sharedPreferencesHelper,
  );

  @override
  Future<ApiResult<LoginResponse>> login(String email, String password) async {
    try {
      final response = await _apiService.login(
        LoginRequestBody(email: email, password: password),
      );

      response?.userData?.let((it) {
        it.token?.let((token) {
          _sharedPreferencesHelper.setSecureString(
            SharedPreferencesKeys.token,
            token,
          );
          _sharedPreferencesHelper.setData(
            SharedPreferencesKeys.isConnected,
            true,
          );
        });
      });
      return ApiResult.success(response);
    } catch (error) {
      print("$error") ;
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
