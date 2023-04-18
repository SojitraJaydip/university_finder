import 'package:flutter/material.dart';

class SearchItems extends SearchDelegate {
  final Widget Function(BuildContext, String) itemBuilder;
  final Widget Function(BuildContext, String)? suggestionBuilder;

  SearchItems({required this.itemBuilder, this.suggestionBuilder});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return itemBuilder(context, query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (suggestionBuilder != null) {
      return suggestionBuilder!(context, query);
    }
    return Container();
  }
}
