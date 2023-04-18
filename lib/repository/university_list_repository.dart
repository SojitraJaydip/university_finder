import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web_app/models/university_data.dart';
import 'package:web_app/services/apis.dart';

class UniversityRepository {
  final String _baseUrl = 'http://universities.hipolabs.com/';

  final ApiServices universityListApiClient = ApiServices();

  Future<List<UniversityData>> fetchUniversities(String countryName) async {
    final response = await universityListApiClient
        .get('${_baseUrl}search?country=$countryName');
    return List<UniversityData>.from(
        response.map((x) => UniversityData.fromJson(x)));
  }
}
