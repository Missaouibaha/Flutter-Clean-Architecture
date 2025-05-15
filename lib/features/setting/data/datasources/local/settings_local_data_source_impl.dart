import 'package:clean_arch_app/core/base/base_local_data_source.dart';
import 'package:clean_arch_app/features/setting/data/datasources/local/settings_local_data_source.dart';

class SettingsLocalDataSourceImpl extends BaseLocalDataSource
    implements SettingsLocalDataSource {
  SettingsLocalDataSourceImpl();

  @override
  Future<void> logout() async {
    await clearDataAndLogout();
  }
}
