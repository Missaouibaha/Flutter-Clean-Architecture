import 'package:clean_arch_app/core/helper/local/shared_preferences_helper.dart';
import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/setting/domain/repository/setting_repository.dart';

class SettingRepositoryImplementation implements SettingRepository {
  final SharedPreferencesHelper _sharedPreferences;

  SettingRepositoryImplementation(this._sharedPreferences);
  @override
  Future<ApiResult<void>> logout() async {
    try {
      await _sharedPreferences.clearAllData();
      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
