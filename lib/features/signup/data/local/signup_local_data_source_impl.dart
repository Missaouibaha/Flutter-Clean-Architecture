import 'package:clean_arch_app/core/base/base_local_data_source.dart';
import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/services/hive/hive_keys.dart';
import 'package:clean_arch_app/features/login/data/datasources/local/models/user_local.dart';
import 'package:clean_arch_app/features/signup/data/local/signup_local_data_source.dart';

class SignupLocalDataSourceImpl extends BaseLocalDataSource
    implements SignupLocalDataSource {
  SignupLocalDataSourceImpl();
  @override
  Future<void> cacheUser(UserLocal user) async {
    await user.token?.let((it) async => await cacheToken(it));
    await cache(HiveKeys.connectedUserBox, HiveKeys.user, user);
  }

  Future<void> cacheToken(String token) async {
    await cacheUserToken(token);
  }
}
