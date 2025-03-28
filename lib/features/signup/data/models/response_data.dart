import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_data.g.dart';

@JsonSerializable()
class ResponseData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;
  ResponseData({this.token, this.userName});
  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);
}
