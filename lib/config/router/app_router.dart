
import 'package:init_flutter_bloc_structure/application/presentation/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _publicRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const InitialScreen(),
    ),

  

  ]);

class RouterSimpleCubit extends Cubit<GoRouter> {
  RouterSimpleCubit() : super(_publicRouter);

  void goBack() => state.pop();
  void goHome() => state.go('/');
}