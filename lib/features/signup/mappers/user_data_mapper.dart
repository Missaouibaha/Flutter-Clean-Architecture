import 'package:clean_arch_app/features/signup/data/local/models/user_local_register_data.dart';
import 'package:clean_arch_app/features/signup/data/remote/models/user_data.dart';

extension UserDataMapper on UserData {
  UserLocalRegisterData toLocal() {
    return UserLocalRegisterData(userName: userName, token: token);
  }
}
