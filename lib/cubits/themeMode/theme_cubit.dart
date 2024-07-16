import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeData.light());
  getThememode() {

    if (state == ThemeData.light()) {
      ThemeData state = ThemeData.dark();
      emit(state);
    } else {
      ThemeData state = ThemeData.light();
      emit(state);
    }
  }
}
