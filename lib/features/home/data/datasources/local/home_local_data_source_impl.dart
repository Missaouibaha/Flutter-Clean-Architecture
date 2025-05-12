import 'package:clean_arch_app/core/services/hive/hive_keys.dart';
import 'package:clean_arch_app/core/services/hive_service.dart';
import 'package:clean_arch_app/features/home/data/datasources/local/home_local_data_source.dart';
import 'package:clean_arch_app/features/home/data/datasources/models/home_data.dart';
import 'package:clean_arch_app/features/login/data/datasources/local/models/user_local_login.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final HiveService _hiveService;
  HomeLocalDataSourceImpl(this._hiveService);

  @override
  Future<UserLocalLogin?> getCachedUser() async {
    return await _hiveService.openAndGet(
      HiveKeys.connectedUserBox,
      HiveKeys.user,
    );
  }

  @override
  Future<void> cacheHomeData(List<HomeData> homeData) async {
    await _hiveService.openAndPut(
      HiveKeys.localHomaDataBox,
      HiveKeys.homaData,
      homeData,
    );
  }

  @override
  Future<List<HomeData>?> getCachedHomeData() async {
    try {
      final data = await _hiveService.openAndGet<List<HomeData>>(
        HiveKeys.localHomaDataBox,
        HiveKeys.homaData,
      );
      return (data as List).cast<HomeData>();
    } catch (error) {
      return [];
    }
  }
}
