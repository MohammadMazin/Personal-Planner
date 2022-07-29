import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:personal_planner/server/constants.dart';

class MongoDb {
  static var db, collectionUsers, collectionExpenses, collectionTasks;

  static connect() async {
    db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);

    collectionUsers = db.collection(COLLECTION_USERS);
    collectionTasks = db.collection(COLLECTION_TASKS);
    collectionExpenses = db.collection(COLLECTION_EXPENSES);
    await collectionUsers
        .insertOne({"_id": ObjectId(), "username": "pablo", "password": "po"});
  }
}
