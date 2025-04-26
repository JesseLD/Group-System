import 'package:flutter/material.dart';
import 'package:group_system_app/features/login/data/model/login_model.dart';
import 'package:group_system_app/features/login/data/repository/login_repository.dart';

class LoginProvider with ChangeNotifier {
  final _repository = LoginRepository();
  LoginModel loginModel = LoginModel.empty();

  bool isLoading = false;

  Future<void> login({required String email, required String password}) async {
    isLoading = true;
    notifyListeners();

    try {
      loginModel = await _repository.login(email: email, password: password);
      isLoading = false;
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
