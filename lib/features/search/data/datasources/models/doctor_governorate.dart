import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'doctor_governorate.g.dart';

@HiveType(typeId: 13)
@JsonSerializable()
class DoctorGovernorate {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;

  DoctorGovernorate({this.id, this.name});

  factory DoctorGovernorate.fromJson(Map<String, dynamic> json) =>
      _$DoctorGovernorateFromJson(json);
}
