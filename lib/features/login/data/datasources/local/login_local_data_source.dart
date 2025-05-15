import 'package:clean_arch_app/features/login/data/datasources/remote/models/user_data.dart';

abstract class LoginLocalDataSource {
  Future<void> cacheUser(UserData user);
}
