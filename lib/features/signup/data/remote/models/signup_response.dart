import 'package:clean_arch_app/features/signup/data/remote/models/user_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  final String? message;
  @JsonKey(name: 'data')
  final UserData? userData;
  final bool? status;
  final int? code;

  SignUpResponse({this.message, this.userData, this.status, this.code});
  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}
