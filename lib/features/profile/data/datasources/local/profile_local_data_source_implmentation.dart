import 'package:clean_arch_app/core/services/hive/hive_keys.dart';
import 'package:clean_arch_app/core/services/hive_service.dart';
import 'package:clean_arch_app/features/profile/data/datasources/local/models/user_local.dart';
import 'package:clean_arch_app/features/profile/data/datasources/local/profile_local_data_source.dart';
import 'package:clean_arch_app/features/profile/data/datasources/remote/models/user_data.dart';
import 'package:clean_arch_app/features/profile/data/mappers/user_data_mapper.dart';

class ProfileLocalDataSourceImplmentation implements ProfileLocalDataSource {
  final HiveService _hiveService;
  ProfileLocalDataSourceImplmentation(this._hiveService);
  @override
  Future<void> cacheUser(UserData user) async {
    final userLocal = user.toLocal();
    await _hiveService.openAndPut(
      HiveKeys.userProfileBox,
      HiveKeys.user,
      userLocal,
    );
  }

  @override
  Future<UserLocal?> getCachedUser() async {
    return _hiveService.openAndGet(HiveKeys.userProfileBox, HiveKeys.user);
  }
}
