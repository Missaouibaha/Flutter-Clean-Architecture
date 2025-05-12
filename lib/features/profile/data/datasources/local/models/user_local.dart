import 'package:hive/hive.dart';

part 'user_local.g.dart';

@HiveType(typeId: 1)
class UserLocal {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String phone;
  @HiveField(3)
  final String gender;

  UserLocal({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
  });
}
