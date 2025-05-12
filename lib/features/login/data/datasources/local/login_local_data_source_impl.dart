import 'package:clean_arch_app/core/services/hive/hive_keys.dart';
import 'package:clean_arch_app/core/services/hive_service.dart';
import 'package:clean_arch_app/features/login/data/datasources/local/login_local_data_source.dart';
import 'package:clean_arch_app/features/login/data/datasources/remote/models/user_data.dart';
import 'package:clean_arch_app/features/login/data/mappers/user_data_mapper.dart';

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final HiveService _hiveService;
  LoginLocalDataSourceImpl(this._hiveService);
  @override
  Future<void> cacheUser(UserData user) async {
    final userLocal = user.toLocal();
    await _hiveService.openAndPut(
      HiveKeys.connectedUserBox,
      HiveKeys.user,
      userLocal,
    );
  }
}
