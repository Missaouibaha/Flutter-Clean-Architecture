import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/helper/local/shared_preferences_helper.dart';
import 'package:clean_arch_app/core/helper/local/shared_preferences_keys.dart';
import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/signup/data/local/signup_local_data_source.dart';
import 'package:clean_arch_app/features/signup/data/remote/models/signup_request_body.dart';
import 'package:clean_arch_app/features/signup/data/remote/signup_remote_data_source.dart';
import 'package:clean_arch_app/features/signup/domain/entities/user.dart';
import 'package:clean_arch_app/features/signup/domain/repositpry/sign_up_repository.dart';
import 'package:clean_arch_app/features/signup/mappers/user_data_mapper.dart';

class SignUpRepositoryImp implements SignUpRepository {
  SignupRemoteDataSource _signupRemoteDataSource;
  SignupLocalDataSource _signupLocalDataSource;
  SharedPreferencesHelper _prefs;
  SignUpRepositoryImp(
    this._signupRemoteDataSource,
    this._signupLocalDataSource,
    this._prefs,
  );

  @override
  Future<ApiResult<bool>> signUp(User user) async {
    try {
      var response = await _signupRemoteDataSource.signup(
        SignupRequestBody(
          user.name,
          user.email,
          user.phone,
          user.password,
          user.conifrmPassword,
          user.gender,
        ),
      );
      return response.when(
        success: (data) {
          data.userData?.let((userData) async {
            await _prefs.setSecureString(
              SharedPreferencesKeys.token,
              userData.token,
            );
            await _prefs.setData(SharedPreferencesKeys.isConnected, true);
            await _signupLocalDataSource.cacheUser(userData.toLocal());
            return ApiResult.success(true);
          });
          return ApiResult.success(false);
        },
        failure: (errorHandler) {
          return ApiResult.failure(ErrorHandler.handle(errorHandler));
        },
      );
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
