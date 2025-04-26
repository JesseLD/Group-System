import 'package:group_system_app/core/network/DioClient.dart';
import 'package:group_system_app/features/splash/data/models/update_model.dart';

class UpdateRepository {
  final _dioClient = DioClient();

  Future<UpdateModel> getUpdates() async {
    try {
    final response = await _dioClient.get("/version");
    print(response.data);
    return UpdateModel.fromMap(response.data["data"]);
    } catch (e) {
      rethrow;
    }
  }
}
