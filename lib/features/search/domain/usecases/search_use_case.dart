import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/search/domain/entities/dotor_entity.dart';
import 'package:clean_arch_app/features/search/domain/repository/search_repository.dart';

class SearchUseCase {
  final SearchRepository _searchRepository;
  SearchUseCase(this._searchRepository);
  Future<ApiResult<List<DoctorEntity>>> call() async {
    return await _searchRepository.getDoctors();
  }
}
