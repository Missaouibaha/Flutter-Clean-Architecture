import 'package:clean_arch_app/features/signup/data/local/models/user_local_register_data.dart';

abstract class SignupLocalDataSource {
  Future<void> cacheUser(UserLocalRegisterData user);
}
