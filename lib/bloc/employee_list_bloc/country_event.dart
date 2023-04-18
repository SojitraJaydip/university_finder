part of 'country_bloc.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object?> get props => [];
}

class FetchCountryEvent extends CountryEvent {
  final bool showFloatingButton;

  const FetchCountryEvent({required this.showFloatingButton});

  @override
  List<Object?> get props => [showFloatingButton];
}

class SearchCountryEvent extends CountryEvent {
  final String country;
  final List<CountryData> countries;

  const SearchCountryEvent({required this.country, required this.countries});

  @override
  List<Object?> get props => [country, countries];
}

class VisibleFloatingButtonEvent extends CountryEvent {
  final bool isVisible;
  final List<CountryData> countries;

  const VisibleFloatingButtonEvent(
      {required this.isVisible, required this.countries});

  @override
  List<Object?> get props => [isVisible, countries];
}
