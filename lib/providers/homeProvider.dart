import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_mar14/network/apiConstants.dart';
import 'package:test_mar14/network/models/movieListResponse.dart';
import '../network/apiService.dart';

class HomeProvider extends ChangeNotifier{
  final ApiService apiService;
  List<Result> results = [];

  HomeProvider({required Dio dio})
      : apiService = ApiService(dio);


  Future<void> callForMovies () async {
    final requestData = {
      "category": "movies",
      "language": "kannada",
      "sort": "voting",
      "genre": "all"
    };

    final response = await apiService.post(ApiConstants.movieList, requestData);

    MovieListResponse movieListResponse =  MovieListResponse.fromJson(response.data);
    notifyListeners();

    results = movieListResponse.result??[];

    print(movieListResponse.result?.length);

  }


}