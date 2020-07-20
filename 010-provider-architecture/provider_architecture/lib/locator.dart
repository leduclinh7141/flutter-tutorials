import 'package:get_it/get_it.dart';
import 'package:provider_architecture/core/services/authentication_sevice.dart';

import 'core/services/api.dart';
import 'core/viewmodels/login_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => LoginModel());
  // locator.registerFactory(() => HomeModel());
  // locator.registerFactory(() => CommentModel());
}
