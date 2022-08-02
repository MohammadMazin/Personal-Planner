import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_planner/screens/tasks.dart';
import 'package:personal_planner/server/tasks.dart';
import 'package:personal_planner/utils/userModel.dart';
import 'package:personal_planner/widgets/button.dart';
import 'package:personal_planner/widgets/inputField.dart';
import 'package:scoped_model/scoped_model.dart';

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
    if (type == 0) {
      return Color.fromARGB(255, 8, 160, 15);
    } else if (type == 1)
      return Color.fromARGB(255, 212, 138, 10);
    else
      return Color.fromARGB(255, 201, 13, 13);
  }

  dynamic handleAddTask(UserModel model, context) async {
    await Tasks.addTask(model.userId, title, description, type)
        .then((value) => print(value));
    showBottomModal(context);
  }

  void showBottomModal(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            child: Column(
          children: [
            LottieBuilder.network(
              'https://assets10.lottiefiles.com/packages/lf20_jbrw3hcz.json',
              repeat: false,
            ),
            Text(
              'Task Added Successfully',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Button(
              title: 'Go Back To Home Screen',
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        ));
      },
    );
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
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Set Task Priority',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 50, 50, 50))),
                        ),
                        const SizedBox(
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
                  const SizedBox(height: 30),
                  ScopedModelDescendant<UserModel>(
                    builder: (context, child, model) {
                      return Button(
                          title: 'Add Task',
                          onPressed: () async {
                            handleAddTask(model, context);
                          });
                    },
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
