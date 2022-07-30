import 'package:flutter/material.dart';
import 'package:personal_planner/screens/tasks.dart';
import 'package:personal_planner/server/tasks.dart';
import 'package:personal_planner/widgets/button.dart';
import 'package:personal_planner/widgets/inputField.dart';

import '../utils/appTheme.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_left)),
          iconTheme: IconThemeData(color: AppTheme.primary),
          backgroundColor: AppTheme.background,
          elevation: 0,
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            padding: EdgeInsets.all(20),
            // color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Add Task',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Input(
                  hintText: 'Title',
                ),
                Input(
                  hintText: 'Task Description',
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppTheme.inputBackground,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.20),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Your Name',
                    ),
                  ),
                ),
                Button(title: 'Add Task', onPressed: () {})
              ],
            ),
          ),
        ));
  }
}
