import 'package:flutter/material.dart';
import 'package:personal_planner/utils/appTheme.dart';

class Input extends StatelessWidget {
  const Input(
      {Key? key, required this.hintText, this.leadingIcon, this.trailingIcon})
      : super(key: key);

  final String hintText;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: AppTheme.inputBackground,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.20),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            leadingIcon,
            color: AppTheme.secondary,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            trailingIcon,
            color: AppTheme.secondary,
          ),
        ],
      ),
    );
  }
}
