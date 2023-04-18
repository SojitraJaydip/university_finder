import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web_app/models/country_data.dart';
import 'package:web_app/services/apis.dart';

class CountryListRepository {
  final String _baseUrl = 'https://restcountries.com/v3.1/';
  final ApiServices countryListApiClient = ApiServices();

  Future<List<CountryData>> fetchCountries() async {
    final response =
        await countryListApiClient.get('${_baseUrl}all?fields=name,flags');

    return List<CountryData>.from(response.map((x) => CountryData.fromJson(x)));
  }
}
