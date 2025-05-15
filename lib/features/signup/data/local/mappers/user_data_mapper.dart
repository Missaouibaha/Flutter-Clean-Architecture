import 'package:clean_arch_app/features/login/data/datasources/local/models/user_local.dart';
import 'package:clean_arch_app/features/signup/data/remote/models/user_data.dart';

extension UserDataMapper on UserData {
  UserLocal toLocal() {
    return UserLocal(name: userName, token: token);
  }
}
