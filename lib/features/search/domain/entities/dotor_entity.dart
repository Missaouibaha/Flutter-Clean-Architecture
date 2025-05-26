
import 'package:clean_arch_app/features/search/domain/entities/city_entity.dart';
import 'package:clean_arch_app/features/search/domain/entities/specialization_entity.dart';

class DoctorEntity {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photoUrl;
  String? gender;
  String? address;
  String? description;
  String? degree;
  SpecializationEntity? specialization;
  CityEntity? city;
  int? appointPrice;

  DoctorEntity({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photoUrl,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.city,
    this.appointPrice,
  });
}
