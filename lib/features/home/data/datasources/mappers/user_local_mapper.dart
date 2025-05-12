import 'package:clean_arch_app/features/home/domain/entities/user.dart';
import 'package:clean_arch_app/features/login/data/datasources/local/models/user_local_login.dart';

extension UserLocalMapper on UserLocalLogin {
  User toDomain() {
    return User(name, token);
  }
}
