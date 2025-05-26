import 'package:clean_arch_app/features/search/data/datasources/models/doctor_city.dart';
import 'package:clean_arch_app/features/search/data/datasources/models/doctor_specialization.dart';
import 'package:clean_arch_app/features/search/data/datasources/models/search_doctor_data.dart';
import 'package:clean_arch_app/features/search/domain/entities/city_entity.dart';
import 'package:clean_arch_app/features/search/domain/entities/dotor_entity.dart';
import 'package:clean_arch_app/features/search/domain/entities/specialization_entity.dart';

extension SearchDoctorMapper on SearchDoctorData {
  DoctorEntity toDomain() {
    return DoctorEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
      photoUrl: photoUrl,
      gender: gender,
      address: address,
      description: description,
      degree: degree,
      specialization: specialization?.toDomain(),
      city: city?.toDomain(),
      appointPrice: appointPrice,
    );
  }
}

extension SpecilisationDoctorDataMapper on DoctorSpecialization {
  SpecializationEntity toDomain() {
    return SpecializationEntity(name: name, id: id);
  }
}

extension CityDoctorDataMapper on DoctorCity {
  CityEntity toDomain() {
    return CityEntity(id: id, name: name);
  }
}
