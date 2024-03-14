import 'package:dio/dio.dart';

import 'networkUtils.dart';

Dio createDio() {
  final dio = Dio();
  // Add request interceptor
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
      // Check for internet connectivity
      bool isConnected = await NetworkUtils.isNetworkAvailable();
      if (!isConnected) {
        handler.reject(
          DioException(
            requestOptions: options,
            error: 'No internet connection',
            type: DioExceptionType.unknown,
          ),
        );
      } else {
        // Continue with the request if there is internet
        handler.next(options);
      }
    },
  ));


  // Add logging interceptor
  dio.interceptors.add(LogInterceptor(
    request: false, // Log request data
    requestHeader: false, // Log request headers
    requestBody: true, // Log request body
    responseHeader: false, // Log response headers
    responseBody: true, // Log response body
    error: true,
    logPrint: print,
  ));

  return dio;
}