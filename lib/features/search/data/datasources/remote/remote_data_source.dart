import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/search/data/datasources/models/doctors_response.dart';

abstract class RemoteDataSource {
  Future<ApiResult<DoctorsResponse>> getDoctors(String token);
}
