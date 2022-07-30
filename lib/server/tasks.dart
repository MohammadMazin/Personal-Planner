import 'package:mongo_dart/mongo_dart.dart';
import 'package:personal_planner/server/server.dart';

class Tasks {
  static Future<dynamic> getUserTasks(String userId) async {
    var result = await MongoDb.collectionTasks
        .find({"userId": ObjectId.parse(userId)}).toList();
    return result;
  }

  static Future<dynamic> addTask(String userId, dynamic data) async {
    //TODO

    var result = await MongoDb.collectionTasks.insertOne();
    return result;
  }
}
