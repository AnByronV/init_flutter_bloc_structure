import 'package:flutter/material.dart';
import 'package:init_flutter_bloc_structure/application/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.test, style: Theme.of(context).textTheme.titleMedium,),
            BlocBuilder<CustomHydratedCubit, bool>(
              builder: (context, state) {
                return Text('HydratedCubit is in: $state');
              },
            ),
          ],
        )
      ),
      // floatingActionButton: _changeLanguageButton(context),
      persistentFooterButtons: [
        _setHydratedButton(context),
        _changeLanguageButton(context),
        _setThemeButton(context),

      ],
    );
  }

  Widget _changeLanguageButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<LocaleCubit>().setLocale(
              context.read<LocaleCubit>().state == const Locale('es')
                  ? const Locale('en')
                  : const Locale('es'),
            );
      },
      tooltip: 'Change language value',
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(Icons.language, color: Colors.white,),
    );
  }

  Widget _setHydratedButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<CustomHydratedCubit>().setFirstTime(
              context.read<CustomHydratedCubit>().state == true ? false : true,
            );
      },
      tooltip: 'Change hydrated cube value',
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(Icons.add, color: Colors.white,),
    );
  }

    Widget _setThemeButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<ThemeCubit>().toggleTheme();
      },
      tooltip: 'Change theme value',
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(Icons.brightness_6, color: Colors.white,),
    );
  }


}
