import 'package:clean_arch_app/features/home/domain/entities/doctor.dart';
import 'package:clean_arch_app/features/home/domain/entities/specialization_entity.dart';

class FiltredHomeData {
  List<Doctor>? doctors;
  List<SpecializationEntity>? specializations;

  FiltredHomeData(this.doctors, this.specializations);
}
