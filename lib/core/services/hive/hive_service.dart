import 'package:clean_arch_app/core/services/hive/hive_keys.dart';
import 'package:clean_arch_app/features/home/data/datasources/models/city.dart';
import 'package:clean_arch_app/features/home/data/datasources/models/doctor_data.dart';
import 'package:clean_arch_app/features/home/data/datasources/models/governorate.dart';
import 'package:clean_arch_app/features/home/data/datasources/models/home_data.dart';
import 'package:clean_arch_app/features/home/data/datasources/models/specialization.dart';
import 'package:clean_arch_app/features/login/data/datasources/local/models/user_local.dart';
import 'package:clean_arch_app/features/profile/data/datasources/local/models/user_local.dart';
import 'package:clean_arch_app/features/search/data/datasources/models/doctor_city.dart';
import 'package:clean_arch_app/features/search/data/datasources/models/doctor_governorate.dart';
import 'package:clean_arch_app/features/search/data/datasources/models/doctor_specialization.dart';
import 'package:clean_arch_app/features/search/data/datasources/models/doctors_response.dart';
import 'package:clean_arch_app/features/search/data/datasources/models/search_doctor_data.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  Future<void> init() async {
    if (!kIsWeb) {
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
    } else {
      await Hive.initFlutter();
    }
    Hive.registerAdapter(UserLocalAdapter());
    Hive.registerAdapter(ProfileLocalAdapter());
    Hive.registerAdapter(HomeDataAdapter());
    Hive.registerAdapter(DoctorDataAdapter());
    Hive.registerAdapter(CityAdapter());
    Hive.registerAdapter(SpecializationAdapter());
    Hive.registerAdapter(GovernorateAdapter());
    Hive.registerAdapter(SearchDoctorDataAdapter());
    Hive.registerAdapter(DoctorSpecializationAdapter());
    Hive.registerAdapter(DoctorsResponseAdapter());
    Hive.registerAdapter(DoctorCityAdapter());
    Hive.registerAdapter(DoctorGovernorateAdapter());

  }

  Future<Box<T>> openBox<T>(String name) async {
    if (!Hive.isBoxOpen(name)) {
      return await Hive.openBox<T>(name);
    }
    return Hive.box<T>(name);
  }

  Box<T> getBox<T>(String name) {
    if (!Hive.isBoxOpen(name)) {
      throw Exception('Box "$name" is not open. Use openBox() first.');
    }
    return Hive.box<T>(name);
  }

  Future<T?> openAndGet<T>(String boxKey, dynamic dataKey) async {
    Box<T> box;
    if (Hive.isBoxOpen(boxKey)) {
      box = Hive.box<T>(boxKey);
    } else {
      box = await Hive.openBox<T>(boxKey);
    }
    return box.get(dataKey);
  }

  Future<void> openAndPut<T>(String boxKey, dynamic dataKey, T data) async {
    Box<T> box;
    if (Hive.isBoxOpen(boxKey)) {
      box = Hive.box<T>(boxKey);
    } else {
      box = await Hive.openBox<T>(boxKey);
    }
    await box.put(dataKey, data);
  }

  Future<void> clearAll() async {
    // fix boxTypes  before  clear box....
    for (var boxName in [
      HiveKeys.connectedUserBox,
      HiveKeys.localHomaDataBox,
      HiveKeys.userProfileBox,
    ]) {
      if (Hive.isBoxOpen(boxName)) {
        await Hive.box(boxName).clear();
        await Hive.box(boxName).close();
      }
    }

    await Hive.close();
    await Hive.deleteFromDisk();
  }

  Future<void> clearBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).clear();
    } else {
      final box = await Hive.openBox(boxName);
      await box.clear();
      await box.close();
    }
  }

  Future<void> clear() async {
    if (Hive.isBoxOpen(HiveKeys.localHomaDataBox)) {
      await Hive.box<List<HomeData>>(HiveKeys.localHomaDataBox).clear();
      await Hive.box<List<HomeData>>(HiveKeys.localHomaDataBox).close();
    }
    if (Hive.isBoxOpen(HiveKeys.userProfileBox)) {
      await Hive.box<ProfileLocal>(HiveKeys.userProfileBox).clear();
      await Hive.box<ProfileLocal>(HiveKeys.userProfileBox).close();
    }
    if (Hive.isBoxOpen(HiveKeys.connectedUserBox)) {
      await Hive.box<UserLocal>(HiveKeys.connectedUserBox).clear();
      await Hive.box<UserLocal>(HiveKeys.connectedUserBox).close();
    }

    await Hive.close();
    await Hive.deleteFromDisk();
  }
}
