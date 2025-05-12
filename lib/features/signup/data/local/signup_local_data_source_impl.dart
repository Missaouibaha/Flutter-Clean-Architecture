import 'package:clean_arch_app/core/services/hive/hive_keys.dart';
import 'package:clean_arch_app/core/services/hive_service.dart';
import 'package:clean_arch_app/features/signup/data/local/models/user_local_register_data.dart';
import 'package:clean_arch_app/features/signup/data/local/signup_local_data_source.dart';

class SignupLocalDataSourceImpl implements SignupLocalDataSource {
  final HiveService _hiveService;
  SignupLocalDataSourceImpl(this._hiveService);
  @override
  Future<void> cacheUser(UserLocalRegisterData user) async {
    await _hiveService.openAndPut(
      HiveKeys.connectedUserBox,
      HiveKeys.user,
      user,
    );
  }
}
