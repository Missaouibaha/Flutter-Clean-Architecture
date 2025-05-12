import 'package:clean_arch_app/core/helper/local/shared_preferences_helper.dart';
import 'package:clean_arch_app/core/helper/local/shared_preferences_keys.dart';
import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/core/networking/api_service.dart';
import 'package:clean_arch_app/features/home/data/datasources/models/home_response.dart';
import 'package:clean_arch_app/features/home/data/datasources/remote/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService _apiService;
  final SharedPreferencesHelper _prefs;

  HomeRemoteDataSourceImpl(this._apiService, this._prefs);

  @override
  Future<ApiResult<HomeResponse>> getHomeData() async {
    try {
      final token = await _prefs.getSecureString(SharedPreferencesKeys.token);
      final response = await _apiService.getHome("Bearer $token");
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
