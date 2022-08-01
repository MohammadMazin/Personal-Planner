import 'package:mongo_dart/mongo_dart.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  String username = '';
  late ObjectId userId;
  String userIdS = '';

  void handleLogin(String _username, ObjectId _userId) {
    username = _username;
    userId = _userId;
    userIdS = _userId.toHexString();
    notifyListeners();
  }

  void handleLogout() {
    username = '';
    userId = ObjectId.fromHexString('');
    userIdS = '';
    notifyListeners();
  }
}
