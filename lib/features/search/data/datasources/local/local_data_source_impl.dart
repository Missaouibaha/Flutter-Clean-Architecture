import 'package:clean_arch_app/core/base/base_local_data_source.dart';
import 'package:clean_arch_app/core/services/hive/hive_keys.dart';
import 'package:clean_arch_app/features/search/data/datasources/local/local_data_source.dart';
import 'package:clean_arch_app/features/search/data/datasources/models/search_doctor_data.dart';

class LocalDataSourceImpl extends BaseLocalDataSource
    implements LocalDataSource {
  @override
  Future<List<SearchDoctorData>> getDoctors() async {
    try {
      final data = await getCached<List<SearchDoctorData>>(
        HiveKeys.doctorsBox,
        HiveKeys.doctors,
      );
      return (data as List).cast<SearchDoctorData>();
    } catch (error) {
      return [];
    }
  }

  @override
  Future<void> saveDoctors(List<SearchDoctorData> doctors) async {
    return await cache(HiveKeys.doctorsBox, HiveKeys.doctors, doctors);
  }

  @override
  Future<String> getToken() async {
    return await getUserToken();
  }
}
