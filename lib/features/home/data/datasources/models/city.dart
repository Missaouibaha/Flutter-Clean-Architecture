import 'package:clean_arch_app/features/home/data/datasources/models/governorate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'city.g.dart';

@HiveType(typeId: 6)
@JsonSerializable()
class City {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @JsonKey(name: 'governrate')
  Governorate? governorate;

  City({this.id, this.name, this.governorate});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
