import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:init_flutter_bloc_structure/l10n/l10n.dart';


class LocaleCubit extends Cubit<Locale?> {
  LocaleCubit() : super(null);

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    emit(locale);
  }

  void clearLocale() {
    emit(const Locale('es'));
  }
}
