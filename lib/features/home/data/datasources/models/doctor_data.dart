import 'package:clean_arch_app/features/home/data/datasources/models/city.dart';
import 'package:clean_arch_app/features/home/data/datasources/models/specialization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'doctor_data.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class DoctorData {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? phone;
  @HiveField(3)
  String? photo;
  @HiveField(4)
  String? gender;
  @HiveField(5)
  String? address;
  @HiveField(6)
  String? description;
  @HiveField(7)
  String? degree;
  @HiveField(8)
  Specialization? specialization;
  @HiveField(9)
  City? city;

  DoctorData({
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.city,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) =>
      _$DoctorDataFromJson(json);
}
