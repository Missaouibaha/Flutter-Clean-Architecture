import 'package:clean_arch_app/features/home/domain/entities/doctor.dart';

class HomeDataEntity {
  int? id;
  String? specialityName;
  List<Doctor>? doctors;

  HomeDataEntity({this.id, this.specialityName, this.doctors});
}
