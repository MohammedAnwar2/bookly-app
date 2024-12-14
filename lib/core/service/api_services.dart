import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  final baseUrl = "https://www.googleapis.com/books/v1/";
  ApiServices({required Dio dio}) : _dio = dio;

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$baseUrl$endpoint');
    return response.data;
  }
}
