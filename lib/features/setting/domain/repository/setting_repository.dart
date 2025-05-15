import 'package:clean_arch_app/core/networking/api_result.dart';

abstract class SettingRepository {
 Future<ApiResult<void>> logout();
}
