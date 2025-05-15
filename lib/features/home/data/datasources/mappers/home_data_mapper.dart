import 'package:clean_arch_app/features/home/data/datasources/models/city.dart';
import 'package:clean_arch_app/features/home/data/datasources/models/doctor_data.dart';
import 'package:clean_arch_app/features/home/data/datasources/models/home_data.dart';
import 'package:clean_arch_app/features/home/data/datasources/models/specialization.dart';
import 'package:clean_arch_app/features/home/domain/entities/city_entity.dart';
import 'package:clean_arch_app/features/home/domain/entities/doctor.dart';
import 'package:clean_arch_app/features/home/domain/entities/home_data_entity.dart';
import 'package:clean_arch_app/features/home/domain/entities/specialization_entity.dart';

extension HomeDataMapper on HomeData {

  HomeDataEntity toDomain() {
    return HomeDataEntity(
      id: id,
      specialityName: specialityName,
      doctors: doctors?.map((doc) => doc.toDomain()).toList() ?? [],
    );
  }
}

extension DoctorDataMapper on DoctorData {
  Doctor toDomain() {
    return Doctor(
      name: name,
      email: email,
      phone: phone,
      photoUrl: photo,
      gender: gender,
      address: address,
      description: description,
      degree: degree,
      specialization: specialization?.toDomain(),
      city: city?.toDomain(),
    );
  }
}

extension SpecilisationDataMapper on Specialization {
  SpecializationEntity toDomain() {
    return SpecializationEntity(name: name, id: id);
  }
}

extension CityDataMapper on City {
  CityEntity toDomain() {
    return CityEntity(id: id, name: name);
  }
}
