import 'package:clean_arch_app/features/home/data/datasources/models/home_data.dart';
import 'package:clean_arch_app/features/login/data/datasources/local/models/user_local.dart';

abstract class HomeLocalDataSource {
  Future<UserLocal?> getCachedUser();
  Future<List<HomeData>?> getCachedHomeData();
  Future<void> cacheHomeData(List<HomeData> homeData);
  Future<String> getToken() ;
}
