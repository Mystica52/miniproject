import 'package:flutter/material.dart';
import './signUp.dart';
import './login.dart';
import './splash.dart';
import 'homepage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/splash':
        return MaterialPageRoute(builder: (_) => const Splash());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case '/signin':
        return MaterialPageRoute(builder: (_) => const SignInPage());
      default:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
    }
  }
}
