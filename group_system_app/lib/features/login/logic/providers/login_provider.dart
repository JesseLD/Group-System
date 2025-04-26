import 'package:flutter/material.dart';
import 'package:group_system_app/features/login/data/model/login_model.dart';
import 'package:group_system_app/features/login/data/repository/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  final _repository = LoginRepository();
  LoginModel loginModel = LoginModel.empty();

  bool isLoading = false;

  Future<void> saveLogin(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("email", email);
    await prefs.setString("password", password);
  }

  Future<void> login({required String email, required String password}) async {
    isLoading = true;
    notifyListeners();

    try {
      loginModel = await _repository.login(email: email, password: password);
      isLoading = false;

      saveLogin(email, password);
      // print("Erro ao fazer login: $e");
      print("Login bem sucedido: ${loginModel.toString()}");
      notifyListeners();
    } catch (e) {
      isLoading = false;
      print("Erro ao fazer login: $e");
      notifyListeners();
      throw Exception("Erro ao fazer login!");
    }
  }
}
