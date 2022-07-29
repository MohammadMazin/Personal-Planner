import 'package:flutter/material.dart';
import 'package:personal_planner/utils/appTheme.dart';

class Input extends StatelessWidget {
  Input({
    Key? key,
    required this.hintText,
    this.leadingIcon,
    this.trailingIcon,
    this.onChanged,
    this.textController,
    this.obscuredText = false,
  }) : super(key: key);

  final TextEditingController? textController;
  final String hintText;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Function? onChanged;
  bool obscuredText;

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
            offset: const Offset(0, 0), // changes position of shadow
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
              onChanged: (text) {
                onChanged!(text);
              },
              controller: textController,
              obscureText: obscuredText,
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
