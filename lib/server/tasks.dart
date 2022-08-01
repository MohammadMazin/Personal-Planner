import 'package:mongo_dart/mongo_dart.dart';
import 'package:personal_planner/server/server.dart';

class Tasks {
  static Future<dynamic> getUserTasks(ObjectId userId) async {
    var result = await MongoDb.collectionTasks
        .find({"userId": ObjectId.parse(userId.toHexString())}).toList();
    return result;
  }

  static Future<dynamic> addTask(
      ObjectId userId, String title, String description, int type) async {
    var data = {
      "userId": ObjectId.fromHexString(userId.toHexString()),
      "title": title,
      "desc": description,
      "type": type
    };

    var result = await MongoDb.collectionTasks.insertOne(data);
    return result;
  }

  static Future<dynamic> deleteTask(ObjectId id) async {
    var result = await MongoDb.collectionTasks.deleteOne({"_id": id});
    return result;
  }
}
