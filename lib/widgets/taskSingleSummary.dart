import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_planner/screens/editTask.dart';
import 'package:personal_planner/server/tasks.dart';
import 'package:personal_planner/utils/appTheme.dart';
import 'package:personal_planner/widgets/button.dart';

class TaskSingleSummary extends StatelessWidget {
  TaskSingleSummary(
      {Key? key,
      required this.title,
      required this.description,
      required this.type,
      required this.id})
      : super(key: key);

  final int type;
  final String title;
  final String description;
  final dynamic id;

  final List<List<Color>> gradientType = [
    [AppTheme.nUrgentStart, AppTheme.nUrgentEnd],
    [AppTheme.importantStart, AppTheme.importantEnd],
    [AppTheme.urgentStart, AppTheme.urgentEnd]
  ];

  void showDeleteModal(context) {
    showModalBottomSheet(
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.3,
          minWidth: MediaQuery.of(context).size.width),
      context: context,
      builder: (context) {
        return Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(
              'Are you sure you want to delete task?',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Button(
              title: 'Delete Task',
              onPressed: () {
                handleDelete(context);
              },
            )
          ],
        ));
      },
    );
  }

  void handleDelete(context) async {
    await Tasks.deleteTask(id);
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            child: Column(
          children: [
            LottieBuilder.asset(
              'assets/success.json',
              height: 250,
              width: 250,
              repeat: false,
            ),
            Text(
              'Task Deleted Successfully',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Button(
              title: 'Go Back To Home Screen',
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
      },
    );
  }

  void handleEdit(dynamic context) {
    print(title);
    print(description);
    print(type);
    print(id);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditTask(
                id: id, title: title, description: description, type: type)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Stack(clipBehavior: Clip.none, children: [
          Positioned(
            left: -15,
            child: Container(
              height: 131,
              width: 30,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(-1, -1),
                    end: Alignment(-1, 1),
                    colors: gradientType[type]),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.82,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              decoration: BoxDecoration(
                color: AppTheme.taskSummaryBg,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 9,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () => showDeleteModal(context),
                            child: Icon(Icons.delete, color: Colors.red)),
                        SizedBox(height: 20),
                        InkWell(
                            onTap: () => handleEdit(context),
                            child: Icon(Icons.edit, color: AppTheme.secondary)),
                        SizedBox(height: 20),
                        Icon(Icons.check, color: AppTheme.primary),
                      ],
                    ),
                  ),
                ],
              )),
        ]),
        SizedBox(height: 10),
      ],
    );
  }
}
