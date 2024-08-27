import 'package:flutter/material.dart';
import 'package:init_flutter_bloc_structure/config/config.dart';
import 'package:init_flutter_bloc_structure/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // Contains the router of the application
    final appRouter = context.watch<RouterSimpleCubit>().state;
    // Contains the locale of the application
    final localeProvider = context.watch<LocaleCubit>().state;
    // Contains theme of the application
    final themeProvider = context.watch<ThemeCubit>().state;

    return MaterialApp.router(
      title: 'Turismo Almería',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: themeProvider.isDarkMode).getTheme(),
      supportedLocales: L10n.all,
      locale: localeProvider,
      localizationsDelegates: L10n.localizationsDelegates,
    );
  }
}