import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../network/apiService.dart';

class HomeProvider extends ChangeNotifier{
  final ApiService apiService;

  HomeProvider({required Dio dio})
      : apiService = ApiService(dio);
}