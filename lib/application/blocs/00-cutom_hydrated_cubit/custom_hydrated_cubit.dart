import 'package:hydrated_bloc/hydrated_bloc.dart';


class CustomHydratedCubit extends HydratedCubit<bool> {
  CustomHydratedCubit() : super(true);

  void setFirstTime(bool isFirstTime) => emit(isFirstTime);

  @override
  bool? fromJson(Map<String, dynamic> json) => json['isFirstTime'] as bool;
  
  @override
  Map<String, dynamic>? toJson(bool state) => {'isFirstTime': state};
}
