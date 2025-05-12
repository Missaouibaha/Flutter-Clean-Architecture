import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/home/domain/entities/home_data_entity.dart';
import 'package:clean_arch_app/features/home/domain/entities/user.dart'
    show User;

abstract class HomeRepository {
  Future<ApiResult<List<HomeDataEntity>>> getHomeData();
  Future<User?> getConnectedUser();
}
