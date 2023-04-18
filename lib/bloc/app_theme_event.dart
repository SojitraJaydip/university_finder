part of 'app_theme_bloc.dart';

abstract class AppThemeEvent extends Equatable {
  const AppThemeEvent();

  @override
  List<Object> get props => [];
}

class AppThemeChanged extends AppThemeEvent {
  final bool isDarkMode;

  const AppThemeChanged({required this.isDarkMode});

  @override
  List<Object> get props => [isDarkMode];
}
