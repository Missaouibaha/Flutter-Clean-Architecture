import 'package:hive/hive.dart';

@HiveType(typeId: 8)
class UserLocalRegisterData {
  @HiveField(0)
  final String? token;
  @HiveField(1)
  final String? userName;
  UserLocalRegisterData({this.token, this.userName});
}
