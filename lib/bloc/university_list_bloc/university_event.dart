part of 'university_bloc.dart';

abstract class UniversityEvent extends Equatable {
  const UniversityEvent();

  @override
  List<Object> get props => [];
}

class FetchUniversityEvent extends UniversityEvent {
  final String countryName;

  const FetchUniversityEvent({required this.countryName});

  @override
  List<Object> get props => [countryName];
}

class SearchUniversityEvent extends UniversityEvent {
  final String university;
  final List<UniversityData> universities;

  const SearchUniversityEvent(
      {required this.university, required this.universities});

  @override
  List<Object> get props => [university, universities];
}
