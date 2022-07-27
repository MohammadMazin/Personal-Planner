import 'package:flutter/material.dart';
import 'package:personal_planner/utils/appTheme.dart';

class Button extends StatelessWidget {
  Button({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(
          key: key,
        );

  final String title;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          primary: AppTheme.primary),
    );
  }
}
