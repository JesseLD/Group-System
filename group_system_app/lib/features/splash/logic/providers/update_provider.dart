import 'package:flutter/widgets.dart';
import 'package:group_system_app/features/splash/data/models/update_model.dart';
import 'package:group_system_app/features/splash/data/repositories/update_repository.dart';

class UpdateProvider with ChangeNotifier {
  UpdateModel updateModel = UpdateModel.empty();
  final _repository = UpdateRepository();

  Future<void> getUpdates() async {
    try {
      updateModel = await _repository.getUpdates();
      notifyListeners();
    } catch (e) {
      // print(e);
      rethrow;
      // Handle error
    }
  }
}
