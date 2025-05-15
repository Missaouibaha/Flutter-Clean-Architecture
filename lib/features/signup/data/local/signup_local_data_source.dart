import 'package:clean_arch_app/features/login/data/datasources/local/models/user_local.dart';

abstract class SignupLocalDataSource {
  Future<void> cacheUser(UserLocal user);
}
