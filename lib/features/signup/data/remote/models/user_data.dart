import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_data.g.dart';

@JsonSerializable()
class UserData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;
  UserData({this.token, this.userName});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);
}
