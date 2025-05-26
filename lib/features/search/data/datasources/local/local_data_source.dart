import 'package:clean_arch_app/features/search/data/datasources/models/search_doctor_data.dart';
 
abstract class LocalDataSource {
  Future<void> saveDoctors(List<SearchDoctorData> doctors);
  Future<List<SearchDoctorData>> getDoctors();
  Future<String> getToken();
}
