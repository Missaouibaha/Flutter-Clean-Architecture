import 'package:clean_arch_app/features/home/data/datasources/models/doctor_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'home_data.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class HomeData {
  @HiveField(0)
  int? id;
  @HiveField(1)
  @JsonKey(name: 'name')
  String? specialityName;
  @HiveField(2)
  List<DoctorData>? doctors;

  HomeData({this.id, this.specialityName, this.doctors});

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);
}
