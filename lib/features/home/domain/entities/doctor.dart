import 'package:clean_arch_app/features/home/domain/entities/city_entity.dart';
import 'package:clean_arch_app/features/home/domain/entities/specialization_entity.dart';

class Doctor {
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

  Doctor({
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
  });
}
