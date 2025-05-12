import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'governorate.g.dart';

@HiveType(typeId: 7)
@JsonSerializable()
class Governorate {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;

  Governorate({this.id, this.name});

  factory Governorate.fromJson(Map<String, dynamic> json) =>
      _$GovernorateFromJson(json);
}
