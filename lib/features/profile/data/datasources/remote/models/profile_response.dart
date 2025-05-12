import 'package:clean_arch_app/features/profile/data/datasources/remote/models/user_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  String? message;
  @JsonKey(name: 'data')
  List<UserData>? userData;
  bool? status;
  int? code;
  ProfileResponse({this.message, this.userData, this.status, this.code});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
