import 'package:flutter/material.dart';
import 'package:personal_planner/utils/appTheme.dart';
import 'package:personal_planner/widgets/taskCategory.dart';
import 'package:personal_planner/widgets/taskCount.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

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
        onPressed: () => print('adddd'),
      ),
      backgroundColor: AppTheme.background,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                TaskCount(title: 'Non Urgent', count: '3', type: 0),
                TaskCount(title: 'Important', count: '3', type: 1),
                TaskCount(title: 'Urgent', count: '3', type: 2),
              ],
            ),
            const SizedBox(height: 50),
            TaskCategory(title: 'Non Urgent', count: 2),
            SizedBox(height: 20),
            TaskCategory(title: 'Important', count: 3),
            SizedBox(height: 20),
            TaskCategory(title: 'Urgent', count: 3),
          ],
        ),
      ),
    );
  }
}
