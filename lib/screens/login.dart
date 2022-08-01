import 'package:flutter/material.dart';
import 'package:personal_planner/screens/home.dart';
import 'package:personal_planner/screens/tasks.dart';
import 'package:personal_planner/server/server.dart';
import 'package:personal_planner/server/tasks.dart';
import 'package:personal_planner/server/users.dart';
import 'package:personal_planner/utils/appTheme.dart';
import 'package:personal_planner/utils/userModel.dart';
import 'package:personal_planner/widgets/inputField.dart';
import 'package:personal_planner/widgets/textLink.dart';
import 'package:personal_planner/widgets/button.dart';
import 'package:scoped_model/scoped_model.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';
  String password = '';

  void handleLogin(String username, String password, UserModel model) async {
    var val = await Users.getUser(username, password);

    if (val != null) {
      model.handleLogin(val['username'], val['_id']);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          // builder: (context) => Home(),
          builder: (context) => TasksScreen(userId: val['_id']),
        ),
      );
    }
  }

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
                  Input(
                    onChanged: (text) => username = text,
                    leadingIcon: Icons.person,
                    hintText: 'Username',
                  ),
                  // const SizedBox(height: 20),
                  Input(
                    onChanged: (text) => password = text,
                    leadingIcon: Icons.key,
                    hintText: 'Password',
                    trailingIcon: Icons.remove_red_eye,
                    obscuredText: true,
                  ),
                  // const SizedBox(height: 20),
                  const Align(
                      alignment: Alignment.centerRight,
                      child: TextLink(text: 'Forgot Password?')),
                  // const SizedBox(height: 20),
                  ScopedModelDescendant<UserModel>(
                    builder: (context, child, model) {
                      return Button(
                        title: 'Login',
                        onPressed: () => handleLogin(username, password, model),
                      );
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Not a member? ',
                          style: TextStyle(
                            fontSize: 16,
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
