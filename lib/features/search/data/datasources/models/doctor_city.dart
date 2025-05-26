import 'package:clean_arch_app/features/search/data/datasources/models/doctor_governorate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'doctor_city.g.dart';

@HiveType(typeId: 12)
@JsonSerializable()
class DoctorCity {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @JsonKey(name: 'governrate')
  DoctorGovernorate? governorate;

  DoctorCity({this.id, this.name, this.governorate});

  factory DoctorCity.fromJson(Map<String, dynamic> json) =>
      _$DoctorCityFromJson(json);
}
