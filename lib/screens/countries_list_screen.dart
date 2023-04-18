import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/bloc/app_theme_bloc.dart';
import 'package:web_app/bloc/employee_list_bloc/country_bloc.dart';
import 'package:web_app/extension.dart';
import 'package:web_app/services/search_delegate.dart';
import 'package:web_app/utils/app_theme.dart';

import '../custom_widget/countries_card.dart';

class CountriesListScreen extends StatelessWidget {
  CountriesListScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CountryBloc()..add(const FetchCountryEvent(showFloatingButton: true)),
      child: Scaffold(
        body: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is CountryLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is CountryLoaded) {
              return CustomScrollView(
                controller: _scrollController
                  ..addListener(() {
                    if (_scrollController.position.userScrollDirection ==
                            ScrollDirection.reverse ||
                        _scrollController.offset == 0) {
                      context.read<CountryBloc>().add(
                          VisibleFloatingButtonEvent(
                              isVisible: false, countries: state.countries));
                    }
                    if (_scrollController.position.userScrollDirection ==
                        ScrollDirection.forward) {
                      context.read<CountryBloc>().add(
                          VisibleFloatingButtonEvent(
                              isVisible: true, countries: state.countries));
                    }
                  }),
                slivers: [
                  SliverAppBar(
                    title: InkWell(
                      onTap: () async {
                        await showSearch(
                            context: context,
                            delegate: SearchItems(
                              itemBuilder: (context, query) {
                                final filteredCountries = state.countries
                                    .where((country) =>
                                        country.name?.common
                                            ?.toLowerCase()
                                            .contains(query.toLowerCase()) ??
                                        false)
                                    .toList();

                                return ListView.builder(
                                  itemBuilder: (context, index) {
                                    final country = filteredCountries[index];
                                    return CountryCard(
                                      country: country,
                                      onTap: () {
                                        context.push(
                                            '/${country.name?.common}/universities');
                                      },
                                    );
                                  },
                                  itemCount: filteredCountries.length,
                                );
                              },
                              suggestionBuilder: (context, query) {
                                final filteredCountries = state.countries
                                    .where((country) =>
                                        country.name?.common
                                            ?.toLowerCase()
                                            .contains(query.toLowerCase()) ??
                                        false)
                                    .toList();

                                return ListView.builder(
                                  //controller: _scrollController,
                                  //physics: AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final country = filteredCountries[index];
                                    return CountryCard(
                                      country: country,
                                      onTap: () {
                                        context.push(
                                            '/${country.name?.common}/universities');
                                      },
                                    );
                                  },
                                  itemCount: filteredCountries.length,
                                );
                              },
                            ));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .iconTheme
                              .color
                              ?.withOpacity(0.2),
                          border: Border.all(
                              color: Theme.of(context).iconTheme.color!),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Theme.of(context).iconTheme.color!,
                            ),
                            Text(
                              'Countries List',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).iconTheme.color!,
                              ),
                            ).paddingOnly(left: 20),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      BlocBuilder<AppThemeBloc, AppThemeState>(
                          builder: (context, state) {
                        if (state is AppThemeInitial) {
                          return IconButton(
                            onPressed: () {
                              context.read<AppThemeBloc>().add(
                                    AppThemeChanged(
                                      isDarkMode:
                                          state.isDarkMode ? false : true,
                                    ),
                                  );
                            },
                            icon: Icon(
                              state.isDarkMode
                                  ? Icons.brightness_4
                                  : Icons.brightness_7,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          );
                        }
                        return const SizedBox();
                      }),
                    ],
                    floating: true,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final country = state.countries[index];
                        return CountryCard(
                          country: country,
                          onTap: () {
                            context
                                .push('/${country.name?.common}/universities');
                          },
                        );
                      },
                      childCount: state.countries.length,
                    ),
                  ),
                ],
              );
            }

            if (state is CountryError) {
              return Center(
                child: SelectableText(state.message),
              );
            }
            return const Center(
              child: Text('Something went wrong'),
            );
          },
        ),
        floatingActionButton: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is CountryLoading) {
              return const SizedBox();
            }
            if (state is CountryLoaded && state.showFloatingButton) {
              return FloatingActionButton(
                onPressed: () {
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                },
                child: const Icon(Icons.arrow_upward_sharp),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
