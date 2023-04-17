
import 'package:flutter/material.dart';
import 'package:offline_comment/view/auth/log_in_page.dart';
import 'package:offline_comment/view/auth/register_page.dart';
import 'package:offline_comment/view/auth/splash_screen.dart';
import 'package:offline_comment/view/home_page.dart';

class RouteGenerator {
  // Singleton
  static final RouteGenerator _generator = RouteGenerator._init();

  static RouteGenerator get router => _generator;

  RouteGenerator._init();

  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return _navigate(page: const HomePage());
      case "splash":
        return _navigate(page: const SplashScreen());
      case "register":
        return _navigate(page: const RegisterPage());
      case "login":
        return _navigate(page: const LogInPage());
    }
    return null;
  }

  MaterialPageRoute _navigate({required Widget page}) {
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }
}