import 'package:group_system_app/core/network/DioClient.dart';
import 'package:group_system_app/features/login/data/model/login_model.dart';

class LoginRepository {
  final _dioClient = DioClient();

  Future<LoginModel> login(
      {required String email, required String password}) async {
    final reponse = await _dioClient.post("login", data: {
      "email": email,
      "password": password,
    });

    if (reponse.statusCode == 200) {
      return LoginModel.fromMap(reponse.data["data"]);
    } else {
      print("Erro ao fazer login: ${reponse.statusCode}");
      print("Erro ao fazer login: ${reponse.data}");
      throw Exception("Erro ao fazer login!");
    }
  }
}
