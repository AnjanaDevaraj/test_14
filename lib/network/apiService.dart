import 'package:dio/dio.dart';

import 'apiConstants.dart';

class ApiService {
  final Dio dio;
  final String baseUrl = ApiConstants.baseUrl;

  ApiService(this.dio);

  // Common method for making GET requests
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    final response = await dio.get('$baseUrl$path', queryParameters: queryParameters);
    // _logRequest(response.requestOptions);
    // _logResponse(response);
    return response;
  }

  // Common method for making POST requests
  Future<Response> post(String path, dynamic data) async {
    final response = await dio.post('$baseUrl$path', data: data);
    // _logRequest(response.requestOptions);
    // _logResponse(response);
    return response;
  }

  // Add more methods for other HTTP methods (PUT, DELETE, etc.) if needed

  // Logging helper methods
  // void _logRequest(RequestOptions options) {
  //   print('API Request: ${options.method} ${options.path}');
  //  // print('Headers: ${options.headers}');
  //   print('Body: ${options.data}');
  // }
  //
  // void _logResponse(Response response) {
  //   print('API Response: ${response.statusCode}');
  //  // print('Headers: ${response.headers}');
  //   print('Body: ${response.data}');
  // }
}
