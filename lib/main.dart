import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mar14/pref/PreferenceManager.dart';
import 'package:test_mar14/providers/authProvider.dart';
import 'package:test_mar14/providers/homeProvider.dart';
import 'package:test_mar14/utilites/appRoutes.dart';
import 'package:test_mar14/view/homeScreen.dart';
import 'package:test_mar14/view/loginScreen.dart';
import 'package:test_mar14/view/registerScreen.dart';
import 'package:test_mar14/view/welcomeScreen.dart';

import 'network/dio.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceManager.init();
  final Dio dio = createDio();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HomeProvider>(
        create: (_) => HomeProvider(dio: dio),
      ),
      ChangeNotifierProvider<AuthProvider>(
        create: (_) => AuthProvider(dio: dio),
      ),
    ],
    child: const MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        fontFamily: 'Poppins'
      ),
      home: WelcomeScreen(),
      onGenerateRoute: onGenerateRoute,
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.welcome: (context) => const WelcomeScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
      },
    );
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
        case AppRoutes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
        case AppRoutes.welcome:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      default:
        return null;
    }
  }

}

