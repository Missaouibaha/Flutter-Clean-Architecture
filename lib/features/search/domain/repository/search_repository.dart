import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/search/domain/entities/dotor_entity.dart';

abstract class SearchRepository {
  Future<ApiResult<List<DoctorEntity>>> getDoctors();
}
