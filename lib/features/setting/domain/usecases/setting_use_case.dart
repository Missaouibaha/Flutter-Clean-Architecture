import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/setting/domain/repository/setting_repository.dart';

class SettingUseCase {
  final SettingRepository settingRepository;
  SettingUseCase(this.settingRepository);

  Future<ApiResult<void>> call()  {
    return settingRepository.logout();
  }
}
