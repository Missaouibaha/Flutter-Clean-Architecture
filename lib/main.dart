import 'package:clean_arch_app/clean_arch_app.dart';
import 'package:clean_arch_app/core/di/dependency_injection.dart';
import 'package:clean_arch_app/core/routing/app_router.dart';
import 'package:clean_arch_app/core/services/hive/hive_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
   final hiveService = HiveService();
  await hiveService.init();
  await setUpGetIt();
  runApp(CleanArchApp(appRouter: AppRouter()));
}
