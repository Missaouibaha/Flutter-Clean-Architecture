import 'package:clean_arch_app/features/login/data/datasources/local/models/user_local_login.dart';
import 'package:clean_arch_app/features/login/data/datasources/remote/models/user_data.dart';
import 'package:clean_arch_app/features/login/domain/entities/user.dart';

extension UserDataMapper on UserData {
  UserLocalLogin toLocal() {
    return UserLocalLogin(name: name, token: token);
  }

  User toDomain() {
    return User(token: token ?? '', name: name ?? '');
  }
}
