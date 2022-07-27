import 'package:flutter/material.dart';
import 'package:personal_planner/utils/appTheme.dart';
import 'package:personal_planner/utils/inputField.dart';
import 'package:personal_planner/utils/textLink.dart';
import 'package:personal_planner/widgets/button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Center(
          child: Container(
              color: AppTheme.background,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Connect \nYour Account',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // const SizedBox(height: 30),
                  const Input(
                    leadingIcon: Icons.person,
                    hintText: 'Username',
                  ),
                  // const SizedBox(height: 20),
                  const Input(
                    leadingIcon: Icons.key,
                    hintText: 'Password',
                    trailingIcon: Icons.remove_red_eye,
                  ),
                  // const SizedBox(height: 20),
                  const Align(
                      alignment: Alignment.centerRight,
                      child: TextLink(text: 'Forgot Password?')),
                  // const SizedBox(height: 20),
                  Button(title: 'Login', onPressed: () {}),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Not a member? ',
                          style: TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          )),
                      TextLink(text: 'Create an Account Now'),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
