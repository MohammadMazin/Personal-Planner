import 'package:flutter/material.dart';
import 'package:personal_planner/utils/appTheme.dart';

class TextLink extends StatelessWidget {
  const TextLink({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('yoooo');
      },
      child: Text(
        text,
        style: TextStyle(
          color: AppTheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.width * 0.043,
        ),
      ),
    );
  }
}
