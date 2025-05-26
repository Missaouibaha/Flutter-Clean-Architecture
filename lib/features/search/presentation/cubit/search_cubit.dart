import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/search/domain/entities/dotor_entity.dart';
import 'package:clean_arch_app/features/search/domain/usecases/search_use_case.dart';
import 'package:clean_arch_app/features/search/presentation/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase _searchUseCase;

  SearchCubit(this._searchUseCase) : super(SearchState.initial());
  List<DoctorEntity> _allDoctors = [];

  String _searchQuery = '';
  int _selectedSpecialityId = 0;

  void emitSearchState() async {
    emit(SearchState.loading());

    try {
      final response = await _searchUseCase.call();
      response.when(
        success: (data) {
          _allDoctors = data;
          _applyFilters();
        },
        failure: (errorHandler) {
          emit(
            SearchState.error(
              error:
                  errorHandler.apiErrorModel.message ?? AppStrings.unknownError,
            ),
          );
        },
      );
    } catch (error) {
      emit(SearchState.error(error: AppStrings.unknownError));
    }
  }

  void filterDoctorsBySearchedEdit(String keyword) {
    _searchQuery = keyword;
    _applyFilters();
  }

  void filterDoctorsBySpeciality(int specialityId) {
    _selectedSpecialityId = specialityId;
    _applyFilters();
  }

  void _applyFilters() {
    List<DoctorEntity> result = _allDoctors;
    if (_selectedSpecialityId != 0) {
      result =
          result.where((doc) {
            return doc.specialization?.id == _selectedSpecialityId;
          }).toList();
    }
    if (_searchQuery.isNotEmpty) {
      result = filterQuery(_searchQuery, result);
    }
    emit(SearchState.success(result));
  }

  List<DoctorEntity> filterQuery(String keyword, List<DoctorEntity> result) {
    final query = keyword.toLowerCase();

    return result.where((doc) {
      final nameMatch = doc.name?.toLowerCase().contains(query) ?? false;
      final specializationMatch =
          doc.specialization?.name?.toLowerCase().contains(query) ?? false;
      return nameMatch || specializationMatch;
    }).toList();
  }
}
