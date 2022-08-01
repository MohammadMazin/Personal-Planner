import 'package:mongo_dart/mongo_dart.dart';
import 'package:personal_planner/server/server.dart';

class Users {
  static addUser(String username, String password) async {
    await MongoDb.collectionUsers.insertOne(
        {"_id": ObjectId(), "username": username, "password": password});
  }

  static Future<dynamic> getUser(String username, String password) async {
    var val = await MongoDb.collectionUsers
        .findOne({"username": username, "password": password});

    return val;
  }
}
