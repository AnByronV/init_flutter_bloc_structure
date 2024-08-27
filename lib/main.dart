import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:init_flutter_bloc_structure/application/app.dart';
import 'package:init_flutter_bloc_structure/application/blocs/blocs.dart';
import 'package:init_flutter_bloc_structure/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  
  /// Initializes the binding for the WidgetsApp.
  WidgetsFlutterBinding.ensureInitialized();
  /// Initializes the storage for the HydratedBloc.
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  
  /// Uncomment this line to avoid the SSL certificate error when using http
  // HttpOverrides.global = MyHttpOverrides();
  
  /// Create the observer
  Bloc.observer = SimpleBlocObserver();
  /// Initialize the service locator
  serviceLocatorInit();
  /// Run the app with only portrait mode
   SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const BlocsProviders());
  });
}


// Blocs Providers
class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<LocaleCubit>()),
        BlocProvider(create: (_) => getIt<ThemeCubit>()),
        BlocProvider(create: (_) => getIt<RouterSimpleCubit>()),
        BlocProvider(create: (_) => getIt<CustomHydratedCubit>()),
      ],
      child: const MyApp(),
    );
  }
}

/// This class is used to avoid the SSL certificate error when using http
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }