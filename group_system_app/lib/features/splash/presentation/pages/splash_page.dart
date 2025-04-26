import 'package:flutter/material.dart';
import 'package:group_system_app/common/constants/app_images.dart';
import 'package:group_system_app/common/widgets/popups.dart';
import 'package:group_system_app/features/login/logic/providers/login_provider.dart';
import 'package:group_system_app/features/splash/logic/providers/update_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isUpdated = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initApp();
    });

    // Future.delayed(Duration(seconds: 2), () {
    //   Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
    // });
  }

  void _initApp() async {
    final isUpdated = await _checkUpdates();

    if (isUpdated) {
      await _autoLogin();
    } else {
      // showMessagePopup(
      //   context,
      //   "Atualização necessária",
      //   "Uma nova versão do aplicativo está disponível. Por favor, atualize para continuar.",
      // );
      Navigator.pushNamedAndRemoveUntil(context, "/outdated", (route) => false);
    }
  }

  // TODO: Update System;
  // TODO: Auto Login;

  Future<void> _autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    final email = prefs.getString("email");
    final password = prefs.getString("password");

    if (email != null && password != null) {
      try {
        await (loginProvider.login(email: email, password: password));
        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
      } catch (e) {
        print("Auto login failed: $e");
        // showMessagePopup(context, "Erro ao fazer login", "Erro ao fazer login com as credenciais salvas. Tente novamente.");
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      }
    } else {
      Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
    }
  }

  Future<bool> _checkUpdates() async {
    print("Checking for updates...");
    final packageInfo = await PackageInfo.fromPlatform();
    final updateProvider = Provider.of<UpdateProvider>(context, listen: false);

    await updateProvider.getUpdates();

    final currentVersion = packageInfo.version;

    if (currentVersion != updateProvider.updateModel.productionVersion &&
        currentVersion != updateProvider.updateModel.developmentVersion) {
      print("App is outdated. Current version: $currentVersion");
      // return showMessagePopup(context, );
      // Navigator.pushNamedAndRemoveUntil(context, "/outdated", (route) => false);
      // return;
      return false;
    } else {
      return true;
      // Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(AppImages.logo),
              width: 100,
            ),
            SizedBox(
              height: 16,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
