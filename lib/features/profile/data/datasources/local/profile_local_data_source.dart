import 'package:clean_arch_app/features/profile/data/datasources/local/models/user_local.dart';
import 'package:clean_arch_app/features/profile/data/datasources/remote/models/user_data.dart';

abstract class ProfileLocalDataSource {
  Future<void> cacheUser(UserData user);
  Future<UserLocal?> getCachedUser();
}
