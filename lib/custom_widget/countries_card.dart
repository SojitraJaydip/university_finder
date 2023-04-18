import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/models/country_data.dart';

class CountryCard extends StatelessWidget {
  final CountryData country;
  final VoidCallback? onTap;
  const CountryCard({Key? key, required this.country, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.all(0),
        child: ListTile(
            mouseCursor: SystemMouseCursors.click,
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(country.name?.common ?? 'Not Found'),
            leading: Image.network(
              country.flags?.png ??
                  'https://www.countryflags.io/IN/flat/64.png',
              width: 40,
              height: 40,
            ),
            onTap: onTap ??
                () {
                  context.go('/university/${country.name?.common}');
                }),
      ),
    );
  }
}
