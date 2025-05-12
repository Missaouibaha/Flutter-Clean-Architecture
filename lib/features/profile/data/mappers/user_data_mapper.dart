import 'package:clean_arch_app/features/profile/data/datasources/local/models/user_local.dart';
import 'package:clean_arch_app/features/profile/data/datasources/remote/models/user_data.dart';
import 'package:clean_arch_app/features/profile/domain/entities/user.dart';

extension UserDataMapper on UserData {
  UserLocal toLocal() {
    return UserLocal(
      name: name ?? '',
      email: email ?? '',
      phone: phone ?? '',
      gender: gender ?? '',
    );
  }

  User toDomain() {
    return User(
      name: name ?? '',
      email: email ?? '',
      phone: phone ?? '',
      gender: gender ?? '',
    );
  }
}

extension UserLocalMapper on UserLocal {
  User toDomain() =>
      User(name: name, email: email, phone: phone, gender: gender);
}
