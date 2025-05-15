import 'package:clean_arch_app/core/base/base_local_data_source.dart';
import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/services/hive/hive_keys.dart';
import 'package:clean_arch_app/features/login/data/datasources/local/login_local_data_source.dart';
import 'package:clean_arch_app/features/login/data/datasources/remote/models/user_data.dart';
import 'package:clean_arch_app/features/login/data/mappers/user_data_mapper.dart';

class LoginLocalDataSourceImpl extends BaseLocalDataSource
    implements LoginLocalDataSource {
  LoginLocalDataSourceImpl() : super();

  @override
  Future<void> cacheUser(UserData user) async {
    final userLocal = user.toLocal();
    await user.token?.let ( (it) async => await cacheToken(it));
    cache(HiveKeys.connectedUserBox, HiveKeys.user, userLocal);
  }

  Future<void> cacheToken(String token) async {
    await cacheUserToken(token);
  }
}
