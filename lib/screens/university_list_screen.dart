import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/custom_widget/college_card.dart';
import 'package:web_app/services/search_delegate.dart';

import '../bloc/university_list_bloc/university_bloc.dart';

class UniversityListScreen extends StatelessWidget {
  final String countryName;
  const UniversityListScreen({Key? key, required this.countryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UniversityBloc()..add(FetchUniversityEvent(countryName: countryName)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('University List'),
          leading: context.canPop()
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    context.pop();
                  },
                )
              : null,
          actions: [
            BlocBuilder<UniversityBloc, UniversityState>(
              builder: (context, state) {
                if (state is UniversityInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is UniversityLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is UniversityLoaded) {
                  return IconButton(
                      onPressed: () {
                        showSearch(
                            context: context,
                            delegate:
                                SearchItems(itemBuilder: (context, query) {
                              final filteredUniversities = state.universities
                                  .where((university) =>
                                      university.name
                                          ?.toLowerCase()
                                          .contains(query.toLowerCase()) ??
                                      false)
                                  .toList();
                              if (filteredUniversities.isEmpty) {
                                return const Center(
                                  child: Text('No University found'),
                                );
                              }
                              return ListView.builder(
                                itemCount: filteredUniversities.length,
                                itemBuilder: (context, index) {
                                  final university =
                                      filteredUniversities[index];
                                  return CollegeCard(
                                    collegeData: university,
                                  );
                                },
                              );
                            }, suggestionBuilder: (context, query) {
                              final filteredUniversities = state.universities
                                  .where((university) =>
                                      university.name
                                          ?.toLowerCase()
                                          .contains(query.toLowerCase()) ??
                                      false)
                                  .toList();
                              if (filteredUniversities.isEmpty) {
                                return const Center(
                                  child: Text('No University found'),
                                );
                              }
                              return ListView.builder(
                                itemCount: filteredUniversities.length,
                                itemBuilder: (context, index) {
                                  final university =
                                      filteredUniversities[index];
                                  return CollegeCard(
                                    collegeData: university,
                                  );
                                },
                              );
                            }));
                      },
                      icon: const Icon(Icons.search));
                }
                if (state is UniversityError) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }
              },
            )
          ],
        ),
        body: BlocBuilder<UniversityBloc, UniversityState>(
          builder: (context, state) {
            if (state is UniversityInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UniversityLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UniversityLoaded) {
              if (state.universities.isEmpty) {
                return const Center(
                  child: Text('No universities found'),
                );
              }

              return ListView.builder(
                itemCount: state.universities.length,
                itemBuilder: (context, index) {
                  final university = state.universities[index];
                  return CollegeCard(
                    collegeData: university,
                  );
                },
              );
            } else if (state is UniversityError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          },
        ),
      ),
    );
  }
}
