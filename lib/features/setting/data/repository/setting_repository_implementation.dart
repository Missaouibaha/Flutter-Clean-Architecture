import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/setting/data/datasources/local/settings_local_data_source.dart';
import 'package:clean_arch_app/features/setting/data/datasources/remote/setting_remote_data_source.dart';
import 'package:clean_arch_app/features/setting/domain/repository/setting_repository.dart';

class SettingRepositoryImplementation implements SettingRepository {
  final SettingsLocalDataSource _settingsLocalDataSource;
  final SettingRemoteDataSource _settingRemoteDataSource;
  SettingRepositoryImplementation(
    this._settingsLocalDataSource,
    this._settingRemoteDataSource,
  );

  @override
  Future<ApiResult<void>> logout() async {
    try {
      await _settingsLocalDataSource.logout();
      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(AppStrings.unknownError));
    }
  }
}
