import 'package:clean_arch_app/core/base/base_local_data_source.dart';
import 'package:clean_arch_app/core/services/hive/hive_keys.dart';
import 'package:clean_arch_app/features/home/data/datasources/local/home_local_data_source.dart';
import 'package:clean_arch_app/features/home/data/datasources/models/home_data.dart';
import 'package:clean_arch_app/features/login/data/datasources/local/models/user_local.dart';

class HomeLocalDataSourceImpl extends BaseLocalDataSource
    implements HomeLocalDataSource {
  HomeLocalDataSourceImpl();

  @override
  Future<UserLocal?> getCachedUser() async {
    return await getCached(HiveKeys.connectedUserBox, HiveKeys.user);
  }

  @override
  Future<void> cacheHomeData(List<HomeData> homeData) async {
    await cache(HiveKeys.localHomaDataBox, HiveKeys.homaData, homeData);
  }

  @override
  Future<List<HomeData>?> getCachedHomeData() async {
    try {
      final data = await getCached<List<HomeData>>(
        HiveKeys.localHomaDataBox,
        HiveKeys.homaData,
      );
      return (data as List).cast<HomeData>();
    } catch (error) {
      return [];
    }
  }

  @override
  Future<String> getToken() async {
    return await getUserToken();
  }
}
