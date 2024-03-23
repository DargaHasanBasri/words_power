import 'dart:async';

import 'package:get_it/get_it.dart';

import '../route/app_routes.dart';


final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => AppRoutes());
}
