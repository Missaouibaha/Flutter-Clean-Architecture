import 'package:clean_arch_app/core/base/base_local_data_source.dart';
import 'package:clean_arch_app/core/services/hive/hive_keys.dart';
import 'package:clean_arch_app/features/profile/data/datasources/local/models/user_local.dart';
import 'package:clean_arch_app/features/profile/data/datasources/local/profile_local_data_source.dart';
import 'package:clean_arch_app/features/profile/data/datasources/remote/models/user_data.dart';
import 'package:clean_arch_app/features/profile/data/mappers/user_data_mapper.dart';

class ProfileLocalDataSourceImplmentation extends BaseLocalDataSource
    implements ProfileLocalDataSource {
  ProfileLocalDataSourceImplmentation();

  @override
  Future<void> cacheUser(UserData user) async {
    final userLocal = user.toLocal();
    cache(HiveKeys.userProfileBox, HiveKeys.user, userLocal);
  }

  @override
  Future<ProfileLocal?> getCachedUser() async {
    return getCached(HiveKeys.userProfileBox, HiveKeys.user);
  }

  @override
  Future<String> getToken() async {
    return await getUserToken();
  }
}
