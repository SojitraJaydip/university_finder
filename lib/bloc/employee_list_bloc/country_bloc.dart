import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/country_data.dart';
import '../../repository/country_list_repository.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(CountryInitial()) {
    on<FetchCountryEvent>(_onFetchCountryEvent);
    on<SearchCountryEvent>(_onSearchCountryEvent);
    on<VisibleFloatingButtonEvent>(_onVisibleFloatingButtonEvent);
  }

  _onFetchCountryEvent(
      FetchCountryEvent event, Emitter<CountryState> emit) async {
    emit(CountryLoading());
    try {
      final List<CountryData> country =
          await CountryListRepository().fetchCountries();
      country.sort((a, b) => a.name!.common!.compareTo(b.name!.common!));

      emit(CountryLoaded(countries: country, showFloatingButton: false));
    } catch (_) {
      emit(CountryError(message: _.toString()));
    }
  }

  _onSearchCountryEvent(
      SearchCountryEvent event, Emitter<CountryState> emit) async {
    emit(CountryLoading());
    try {
      List<CountryData> countries = [];

      event.countries
          .where((element) => element.name!.common!
              .toLowerCase()
              .contains(event.country.toLowerCase()))
          .forEach((element) {
        countries.add(element);
      });

      emit(CountryLoaded(countries: countries, showFloatingButton: true));
    } catch (_) {
      emit(CountryError(message: _.toString()));
    }
  }

  _onVisibleFloatingButtonEvent(
      VisibleFloatingButtonEvent event, Emitter<CountryState> emit) async {
    emit(CountryLoading());
    try {
      emit(CountryLoaded(
          countries: event.countries, showFloatingButton: event.isVisible));
    } catch (_) {
      emit(CountryError(message: _.toString()));
    }
  }
}
