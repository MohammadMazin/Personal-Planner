import 'package:flutter/material.dart';
import 'package:personal_planner/utils/appTheme.dart';
import 'package:personal_planner/widgets/taskSingleSummary.dart';

class TaskCategory extends StatefulWidget {
  const TaskCategory(
      {Key? key, required this.title, required this.count, required this.data})
      : super(key: key);

  final String title;
  final List<dynamic> data;
  final int count;

  @override
  State<TaskCategory> createState() => _TaskCategoryState();
}

class _TaskCategoryState extends State<TaskCategory> {
  dynamic mapDataToTaskSummary() {
    List<TaskSingleSummary> tasks = [];

    widget.data.forEach((element) {
      tasks.add(TaskSingleSummary(
          title: element['title'],
          description: element['desc'],
          type: element['type'],
          id: element['_id']));
    });

    return tasks;

    // var thiso = widget.data
    //     .map((task) => {
    //           TaskSingleSummary(
    //               title: task["title"],
    //               description: task["desc"],
    //               type: task["type"])
    //         })
    //     .toList();
    // print(thiso);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(widget.title,
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Text('${widget.count} Tasks',
                      style: TextStyle(
                        fontSize: 16,
                      )),
                ],
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          Column(
            children: mapDataToTaskSummary(),
          )
        ],
      ),
    );
  }
}
