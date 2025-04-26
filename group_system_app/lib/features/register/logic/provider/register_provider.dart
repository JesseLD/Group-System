import 'package:flutter/material.dart';
import 'package:group_system_app/features/register/data/model/register_model.dart';
import 'package:group_system_app/features/register/data/repository/register_repository.dart';

class RegisterProvider with ChangeNotifier {
  final _repository = RegisterRepository();

  Future<void> register(RegisterModel registerModel) async {
    try {
      await _repository.register(registerModel);
      notifyListeners();
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }
}
