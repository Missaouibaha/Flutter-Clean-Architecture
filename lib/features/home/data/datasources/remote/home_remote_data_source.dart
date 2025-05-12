

import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/home/data/datasources/models/home_response.dart';

abstract class HomeRemoteDataSource {

  Future<ApiResult<HomeResponse>> getHomeData();
}