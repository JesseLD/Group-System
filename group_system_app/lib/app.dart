import 'package:flutter/material.dart';
import 'package:group_system_app/common/constants/app_theme.dart';
import 'package:group_system_app/common/router/app_router.dart';
import 'package:group_system_app/features/login/logic/providers/login_provider.dart';
import 'package:group_system_app/features/register/logic/provider/register_provider.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Group System',
        theme: AppTheme.lightTheme,
        initialRoute: "/",
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
