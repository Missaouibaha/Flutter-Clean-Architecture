import 'package:clean_arch_app/features/home/data/datasources/models/home_data.dart';
import 'package:clean_arch_app/features/login/data/datasources/local/models/user_local_login.dart';

abstract class HomeLocalDataSource {
  Future<UserLocalLogin?> getCachedUser();
  Future<List<HomeData>?> getCachedHomeData();
  Future<void> cacheHomeData(List<HomeData> homeData);
}
