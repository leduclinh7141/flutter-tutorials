import 'package:get_it/get_it.dart';
import 'package:scoped_guide/scoped_models/home_model.dart';
import 'package:scoped_guide/services/storage_service.dart';

GetIt locator = GetIt();

void setupLocator() {
  // Register services
  locator.registerLazySingleton<StorageService>(() => StorageService());
  // Register models

  locator.registerFactory<HomeModel>(() => HomeModel());
}
