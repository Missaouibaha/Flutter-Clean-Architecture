import 'package:clean_arch_app/features/home/domain/entities/city_entity.dart';
import 'package:clean_arch_app/features/home/domain/entities/doctor.dart';
import 'package:clean_arch_app/features/home/domain/entities/home_data_entity.dart';
import 'package:clean_arch_app/features/home/domain/entities/specialization_entity.dart';

class HomeDataMapper {
  List<SpecializationEntity> mapSpecialization(List<HomeDataEntity> data) {
    return data
        .map((element) {
          return SpecializationEntity(
            id: element.id,
            name: element.specialityName,
          );
        })
        .toSet()
        .toList();
  }

  List<Doctor> mapDoctors(List<HomeDataEntity> data) {
    return data
            ?.expand((e) {
              return e.doctors?.map((doc) {
                    return Doctor(
                      name: doc.name,
                      email: doc.email,
                      phone: doc.phone,
                      gender: doc.gender,
                      photoUrl: doc.photoUrl,
                      address: doc.address,
                      degree: doc.degree,
                      description: doc.description,
                      specialization: SpecializationEntity(
                        id: doc.specialization?.id,
                        name: doc.specialization?.name,
                      ),
                      city: CityEntity(id: doc.city?.id, name: doc.city?.name),
                    );
                  }) ??
                  [];
            })
            .toSet()
            .toList()
            .cast<Doctor>() ??
        [];
  }
}
