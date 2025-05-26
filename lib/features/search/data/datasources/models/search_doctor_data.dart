import 'package:clean_arch_app/features/search/data/datasources/models/doctor_city.dart';
import 'package:clean_arch_app/features/search/data/datasources/models/doctor_specialization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'search_doctor_data.g.dart';

@HiveType(typeId: 10)
@JsonSerializable()
class SearchDoctorData {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? phone;
  @HiveField(4)
  @JsonKey(name: "photo")
  String? photoUrl;
  @HiveField(5)
  String? gender;
  @HiveField(6)
  String? address;
  @HiveField(7)
  String? description;
  @HiveField(8)
  String? degree;
  @HiveField(9)
  @JsonKey(name: 'appoint_price')
  int? appointPrice;
  @HiveField(10)
  DoctorSpecialization? specialization;
  @HiveField(11)
  DoctorCity? city;

  SearchDoctorData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photoUrl,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.appointPrice,
    this.specialization,
    this.city,
  });

  factory SearchDoctorData.fromJson(Map<String, dynamic> json) =>
      _$SearchDoctorDataFromJson(json);
}
