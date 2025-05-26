import 'package:clean_arch_app/features/search/data/datasources/models/search_doctor_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'doctors_response.g.dart';

@HiveType(typeId: 9)
@JsonSerializable()
class DoctorsResponse {
  String? message;
  @HiveField(1)
  @JsonKey(name: 'data')
  List<SearchDoctorData>? doctors;
  bool? status;
  int? code;

  DoctorsResponse({this.message, this.doctors, this.code, this.status});

  factory DoctorsResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorsResponseFromJson(json);
}
