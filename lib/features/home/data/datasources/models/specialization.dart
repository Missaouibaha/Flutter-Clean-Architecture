import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'specialization.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class Specialization {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;

  Specialization({this.id, this.name});

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);
}
