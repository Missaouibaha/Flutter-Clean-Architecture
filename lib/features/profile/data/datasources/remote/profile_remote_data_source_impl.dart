import 'package:clean_arch_app/core/helper/local/shared_preferences_helper.dart';
import 'package:clean_arch_app/core/helper/local/shared_preferences_keys.dart';
import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/core/networking/api_service.dart';
import 'package:clean_arch_app/features/profile/data/datasources/remote/models/profile_response.dart';
import 'package:clean_arch_app/features/profile/data/datasources/remote/profile_remote_data_source.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiService _apiService;
  final SharedPreferencesHelper _prefs;

  ProfileRemoteDataSourceImpl(this._apiService, this._prefs);

  @override
  Future<ApiResult<ProfileResponse>> getProfile() async {
    try {
      final token = await _prefs.getSecureString(SharedPreferencesKeys.token);
      final response = await _apiService.getProfile("Bearer $token");
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
