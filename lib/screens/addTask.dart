import 'package:flutter/cupertino.dart';
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
  String title = '';
  String description = '';
  int type = 0;

  Color selectorColor() {
    // if (type == 0)
    //   return AppTheme.nUrgentEnd;
    // else if (type == 1)
    //   return AppTheme.importantStart;
    // else
    //   return AppTheme.urgentStart;
    if (type == 0) {
      return Color.fromARGB(255, 8, 160, 15);
    } else if (type == 1)
      return Color.fromARGB(255, 212, 138, 10);
    else
      return Color.fromARGB(255, 201, 13, 13);
  }

  dynamic handleAddTask() async {
    await Tasks.addTask('62e12319529a45d4c5bdd5ec', title, description, type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                children: [
                  Icon(Icons.arrow_left),
                  Text(
                    'Back',
                    style: TextStyle(
                        color: AppTheme.primary, fontWeight: FontWeight.bold),
                  )
                ],
              )),
          iconTheme: IconThemeData(color: AppTheme.primary),
          backgroundColor: AppTheme.background,
          elevation: 0,
        ),
        body: ListView(children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              padding: EdgeInsets.all(20),
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                  SizedBox(height: 10),
                  Input(
                    hintText: 'Title',
                    onChanged: (text) {
                      title = text;
                    },
                  ),
                  SizedBox(height: 30),
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
                      onChanged: (text) => description = text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Task Description',
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Set Task Priority',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 50, 50, 50))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CupertinoSegmentedControl<int>(
                            selectedColor: selectorColor(),
                            unselectedColor: Colors.grey[200],
                            borderColor: Colors.black,
                            groupValue: type,
                            children: const {
                              0: Text('    Non-Urgent    '),
                              1: Text('    Important    '),
                              2: Text('    Urgent    '),
                            },
                            onValueChanged: (groupValue) {
                              setState(() {
                                type = groupValue;
                              });
                            }),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Button(
                      title: 'Add Task',
                      onPressed: () async {
                        handleAddTask();
                      })
                ],
              ),
            ),
          ),
        ]));
  }
}
