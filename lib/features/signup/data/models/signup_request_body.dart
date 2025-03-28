import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  String name;
  String email;
  String phone;
  String password;
  @JsonKey(name: 'password_confirmation')
  String confirmPassword;
  int gender;

  SignupRequestBody(
    this.name,
    this.email,
    this.phone,
    this.password,
    this.confirmPassword,
    this.gender,
  );

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
