import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(const AppThemeInitial()) {
    on<AppThemeChanged>((event, emit) {
      emit(AppThemeInitial(isDarkMode: event.isDarkMode));
    });
  }
}
