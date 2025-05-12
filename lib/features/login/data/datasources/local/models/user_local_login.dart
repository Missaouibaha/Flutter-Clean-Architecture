import 'package:hive_flutter/hive_flutter.dart';

part 'user_local_login.g.dart';

@HiveType(typeId: 0)
class UserLocalLogin {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? token;

  UserLocalLogin({this.name, this.token});
}
