import 'package:clean_arch_app/core/base/base_remote_data_source.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/search/data/datasources/models/doctors_response.dart';
import 'package:clean_arch_app/features/search/data/datasources/remote/remote_data_source.dart';

class RemoteDataSourceImpl extends BaseRemoteDataSource
    implements RemoteDataSource {
  RemoteDataSourceImpl();
  @override
  Future<ApiResult<DoctorsResponse>> getDoctors(String token) async {
 
    return safeApiCall(() async { 

      return await apiService.getDoctors("Bearer $token");
    });
  }
}
