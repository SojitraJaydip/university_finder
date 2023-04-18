part of 'university_bloc.dart';

abstract class UniversityState extends Equatable {
  const UniversityState();
}

class UniversityInitial extends UniversityState {
  @override
  List<Object> get props => [];
}

class UniversityLoading extends UniversityState {
  @override
  List<Object> get props => [];
}

class UniversityLoaded extends UniversityState {
  final List<UniversityData> universities;
  final bool showFloatingButton;

  const UniversityLoaded(
      {required this.universities, required this.showFloatingButton});

  @override
  List<Object> get props => [universities];
}

class UniversityError extends UniversityState {
  final String message;

  const UniversityError({required this.message});

  @override
  List<Object> get props => [message];
}
