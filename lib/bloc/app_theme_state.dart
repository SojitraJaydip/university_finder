part of 'app_theme_bloc.dart';

abstract class AppThemeState extends Equatable {
  const AppThemeState();
}

class AppThemeInitial extends AppThemeState {
  final bool isDarkMode;
  const AppThemeInitial({this.isDarkMode = false});
  @override
  List<Object> get props => [isDarkMode];
}
