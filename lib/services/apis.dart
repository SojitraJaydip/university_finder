import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web_app/services/api_exception.dart';

class ApiServices {
  //final String _baseUrl = 'https://dummy.restapiexample.com/api/v1/';
  final _dio = Dio();

  Future<dynamic> get(String url) async {
    try {
      final response = await _dio.get(url);

      print("Url: $url \n Response: ${response.data}");

      return _returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet connection');
    } on HttpException {
      throw FetchDataException('No Service found');
    } on FormatException {
      throw InvalidInputException('Bad response format');
    } catch (e) {
      throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${e.toString()}');
    }
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.data;
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
        throw BadRequestException(response.data.toString());
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
