import 'package:flutter/material.dart';
import 'package:personal_planner/utils/appTheme.dart';

class TaskCount extends StatelessWidget {
  TaskCount(
      {Key? key, required this.title, required this.count, required this.type})
      : super(key: key);

  final String title;
  final String count;
  final int type;
  final double WIDTH = 100;

  final List<List<Color>> gradientType = [
    [AppTheme.nUrgentStart, AppTheme.nUrgentEnd],
    [AppTheme.importantStart, AppTheme.importantEnd],
    [AppTheme.urgentStart, AppTheme.urgentEnd]
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Positioned(
        bottom: -10,
        child: Container(
          height: 30,
          width: WIDTH,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: gradientType[type]),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      Container(
        height: 140,
        width: WIDTH,
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  count,
                  style: TextStyle(
                      color: AppTheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 50),
                ),
              ),
            ]),
      ),
    ]);
  }
}
