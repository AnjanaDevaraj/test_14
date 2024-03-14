import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../network/apiService.dart';

class AuthProvider extends ChangeNotifier{

  final ApiService apiService;

  AuthProvider({required Dio dio})
      : apiService = ApiService(dio);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController professionController = TextEditingController();

}