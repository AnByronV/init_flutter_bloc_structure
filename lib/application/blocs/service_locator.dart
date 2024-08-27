

import 'package:init_flutter_bloc_structure/config/config.dart';
import 'package:get_it/get_it.dart';

import 'blocs.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  
  getIt.registerSingleton(RouterSimpleCubit());

  getIt.registerSingleton(CustomHydratedCubit());

  getIt.registerSingleton<LocaleCubit>(LocaleCubit());

  getIt.registerSingleton<ThemeCubit>(ThemeCubit());
}