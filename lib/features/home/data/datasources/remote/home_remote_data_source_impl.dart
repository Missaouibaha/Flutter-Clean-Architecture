import 'package:clean_arch_app/core/base/base_remote_data_source.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/home/data/datasources/models/home_response.dart';
import 'package:clean_arch_app/features/home/data/datasources/remote/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl extends BaseRemoteDataSource
    implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl();

  @override
  Future<ApiResult<HomeResponse>> getHomeData(String token) async {
    return safeApiCall(() async {
      return await apiService.getHome("Bearer $token");
    });
  }
}
