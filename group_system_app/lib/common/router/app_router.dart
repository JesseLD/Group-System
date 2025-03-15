import 'package:flutter/material.dart';
import 'package:group_system_app/features/home/presentation/page/home_page.dart';
import 'package:group_system_app/features/login/presentation/pages/login_page.dart';
import 'package:group_system_app/features/register/presentation/pages/register_page.dart';
import 'package:group_system_app/features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );

      case "/login":
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case "/register":
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );

      case "/home":
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

      default:
        return MaterialPageRoute(
          // ignore: avoid_unnecessary_containers
          builder: (_) => Container(
            child: Text("No route defined for ${settings.name}"),
          ),
        );
    }
  }
}
