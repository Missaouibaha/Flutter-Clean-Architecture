import 'package:clean_arch_app/features/home/domain/entities/user.dart';
import 'package:clean_arch_app/features/login/data/datasources/local/models/user_local.dart';

extension UserLocalMapper on UserLocal {
  User toDomain() {
    return User(name, token);
  }
}
