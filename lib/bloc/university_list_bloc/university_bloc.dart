import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:web_app/models/university_data.dart';
import 'package:web_app/repository/university_list_repository.dart';

part 'university_event.dart';
part 'university_state.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  UniversityBloc() : super(UniversityInitial()) {
    on<FetchUniversityEvent>(_onFetchUniversityEvent);
    on<SearchUniversityEvent>(_onSearchUniversityEvent);
  }

  _onFetchUniversityEvent(
      FetchUniversityEvent event, Emitter<UniversityState> emit) async {
    emit(UniversityLoading());
    try {
      final List<UniversityData> university =
          await UniversityRepository().fetchUniversities(event.countryName);
      university.sort((a, b) => a.name!.compareTo(b.name!));
      emit(UniversityLoaded(
          universities: university, showFloatingButton: false));
    } catch (_) {
      emit(UniversityError(message: _.toString()));
    }
  }

  _onSearchUniversityEvent(
      SearchUniversityEvent event, Emitter<UniversityState> emit) async {
    emit(UniversityLoading());
    try {
      final List<UniversityData> university = event.universities
          .where((university) =>
              university.name!.toLowerCase().contains(event.university))
          .toList();
      emit(UniversityLoaded(
          universities: university, showFloatingButton: false));
    } catch (_) {
      emit(UniversityError(message: _.toString()));
    }
  }
}
