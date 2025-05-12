import 'package:clean_arch_app/features/home/data/datasources/models/home_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  String? message;
  @JsonKey(name: 'data')
  List<HomeData>? homeData;
  bool? status;
  int? code;

  HomeResponse({this.message, this.homeData, this.status, this.code});

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
}
