part of 'country_bloc.dart';

abstract class CountryState extends Equatable {
  const CountryState();
}

class CountryInitial extends CountryState {
  @override
  List<Object> get props => [];
}

class CountryLoading extends CountryState {
  @override
  List<Object> get props => [];
}

class CountryLoaded extends CountryState {
  final List<CountryData> countries;
  final bool showFloatingButton;

  const CountryLoaded(
      {required this.countries, required this.showFloatingButton});

  @override
  List<Object> get props => [countries];
}

class CountryError extends CountryState {
  final String message;

  const CountryError({required this.message});

  @override
  List<Object> get props => [message];
}
