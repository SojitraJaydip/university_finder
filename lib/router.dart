import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/screens/countries_list_screen.dart';
import 'package:web_app/screens/university_list_screen.dart';

import 'screens/clock_screen.dart';

class AppRouter {
  static final GoRouter route = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, state) => CountriesListScreen()),
        GoRoute(
            path: '/:country_name/universities',
            builder: (_, state) => UniversityListScreen(
                  countryName: state.params['country_name'] ?? '',
                )),
      ],
      errorBuilder: (context, state) {
        return Scaffold(
          body: Center(
            child: Text('Error: ${state.error}'),
          ),
        );
      });
}
