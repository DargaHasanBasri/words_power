import 'dart:async';

import 'package:get_it/get_it.dart';

import 'package:words_power/route/app_routes.dart';


final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(AppRoutes.new);
}
