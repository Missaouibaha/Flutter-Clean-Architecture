import 'package:clean_arch_app/core/helper/local/shared_preferences_helper.dart';
import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/core/services/hive_service.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/setting/domain/repository/setting_repository.dart';

class SettingRepositoryImplementation implements SettingRepository {
  final SharedPreferencesHelper _sharedPreferences;
  final HiveService _hiveService;
  SettingRepositoryImplementation(this._sharedPreferences, this._hiveService);

  @override
  Future<ApiResult<void>> logout() async {
    try {
      await _hiveService.clear();
      await _sharedPreferences.clearAllData();
      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(AppStrings.unknownError));
    }
  }
}
