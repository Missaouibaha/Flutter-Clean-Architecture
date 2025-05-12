import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/home/domain/entities/filtred_home_data.dart';
import 'package:clean_arch_app/features/home/domain/mappers/home_data_mapper.dart';
import 'package:clean_arch_app/features/home/domain/repository/home_repository.dart';

class HomeUseCase {
  final HomeRepository _homeRepository;
  HomeUseCase(this._homeRepository);

  Future<ApiResult<FiltredHomeData>> call() async {
    final result = await _homeRepository.getHomeData();

    return result.when(
      success: (response) {
        final specializations = HomeDataMapper().mapSpecialization(
          response ?? [],
        );

        final doctors = HomeDataMapper().mapDoctors(response ?? []);

        return ApiResult.success(FiltredHomeData(doctors, specializations));
      },
      failure: (error) {
        return ApiResult.failure(error);
      },
    );
  }
}
