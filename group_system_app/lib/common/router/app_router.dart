import 'package:flutter/material.dart';
import 'package:group_system_app/features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
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
