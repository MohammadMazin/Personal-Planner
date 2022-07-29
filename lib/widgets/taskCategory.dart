import 'package:flutter/material.dart';
import 'package:personal_planner/utils/appTheme.dart';
import 'package:personal_planner/widgets/taskSingleSummary.dart';

class TaskCategory extends StatelessWidget {
  const TaskCategory({Key? key, required this.title, required this.count})
      : super(key: key);

  final String title;
  final int count;

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
                  Text(title,
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Text('${count} Tasks',
                      style: TextStyle(
                        fontSize: 16,
                      )),
                ],
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          TaskSingleSummary(type: 0),
          TaskSingleSummary(type: 1),
          TaskSingleSummary(type: 2),
        ],
      ),
    );
  }
}
