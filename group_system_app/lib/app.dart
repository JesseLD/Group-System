import 'package:flutter/material.dart';
import 'package:group_system_app/common/constants/app_theme.dart';
import 'package:group_system_app/common/router/app_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Group System',
      theme: AppTheme.lightTheme,
      initialRoute: "/",
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
