import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/helper/local/shared_preferences_helper.dart';
import 'package:clean_arch_app/core/helper/local/shared_preferences_keys.dart';
import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/core/networking/api_service.dart';
import 'package:clean_arch_app/features/signup/data/models/signup_request_body.dart';
import 'package:clean_arch_app/features/signup/data/models/signup_response.dart';
import 'package:clean_arch_app/features/signup/domain/entities/user.dart';
import 'package:clean_arch_app/features/signup/domain/repositpry/sign_up_repository.dart';

class SignUpRepositoryImp implements SignUpRepository {
  final ApiService _apiService;
  final SharedPreferencesHelper _sharedPreferencesHelper;

  SignUpRepositoryImp(this._apiService, this._sharedPreferencesHelper);

  @override
  Future<ApiResult<SignUpResponse>> signUp(User user) async {
    try {
      var response = await _apiService.signUp(
        SignupRequestBody(
          user.name,
          user.email,
          user.phone,
          user.password,
          user.conifrmPassword,
          user.gender,
        ),
      );

      response.responseData?.let((data) {
        data.token?.let((token) {
          _sharedPreferencesHelper.setSecureString(
            SharedPreferencesKeys.token,
            token,
          );
        });
        _sharedPreferencesHelper.setData(
          SharedPreferencesKeys.isConnected,
          true,
        );
      });

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
