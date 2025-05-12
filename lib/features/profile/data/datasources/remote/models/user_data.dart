
import 'package:json_annotation/json_annotation.dart';
part 'user_data.g.dart';
@JsonSerializable()
class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;
  UserData({ this.id, this.name ,this.email,this.phone,this.gender});
  factory UserData.fromJson(Map<String,dynamic> json) => _$UserDataFromJson(json) ;

}
