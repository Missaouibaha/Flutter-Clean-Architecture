import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'doctor_specialization.g.dart';

@HiveType(typeId: 11)
@JsonSerializable()
class DoctorSpecialization {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;

  DoctorSpecialization({this.id, this.name});

  factory DoctorSpecialization.fromJson(Map<String, dynamic> json) =>
      _$DoctorSpecializationFromJson(json);
}
