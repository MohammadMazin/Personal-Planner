import 'package:flutter/material.dart';
import 'package:personal_planner/screens/addTask.dart';
import 'package:personal_planner/server/tasks.dart';
import 'package:personal_planner/utils/appTheme.dart';
import 'package:personal_planner/widgets/taskCategory.dart';
import 'package:personal_planner/widgets/taskCount.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    super.initState();
    getUsers();
  }

  List<dynamic> task0 = [];
  List<dynamic> task1 = [];
  List<dynamic> task2 = [];

  void getUsers() async {
    task0 = [];
    task1 = [];
    task2 = [];
    var taskList = await Tasks.getUserTasks('62e12319529a45d4c5bdd5ec');
    for (var task in taskList) {
      if (task["type"] == 0)
        task0.add(task);
      else if (task["type"] == 1)
        task1.add(task);
      else if (task["type"] == 2) task2.add(task);
    }
    // print(task0);
    // print('\n\n\n');
    // print(task1);
    // print('\n\n\n');
    // print(task2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppTheme.primary),
        backgroundColor: AppTheme.background,
        elevation: 0,
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: AppTheme.primary,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddTask()),
        ),
      ),
      backgroundColor: AppTheme.background,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(onPressed: getUsers, child: Text('press')),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tasks',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TaskCount(
                    title: 'Non Urgent',
                    count: task0.length.toString(),
                    type: 0),
                TaskCount(
                    title: 'Important',
                    count: task1.length.toString(),
                    type: 1),
                TaskCount(
                    title: 'Urgent', count: task2.length.toString(), type: 2),
              ],
            ),
            const SizedBox(height: 50),
            TaskCategory(title: 'Non Urgent', count: task0.length, data: task0),
            const SizedBox(height: 20),
            TaskCategory(title: 'Important', count: task1.length, data: task1),
            const SizedBox(height: 20),
            TaskCategory(title: 'Urgent', count: task2.length, data: task2),
          ],
        ),
      ),
    );
  }
}
