import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import './globals.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String showNum = "";
  bool _authenticated = false;
  String _pass = "1234";
  final passController = TextEditingController();

  bool getAuth() {
    return _authenticated;
  }

  void _addPass(input) {
    setState(() {
      showNum == "Incorrect Pass!" ? showNum = "" : print("norm");
      //print(input);
      showNum += input;
      print(showNum.length);
    });
  }

  void _submitPass() {
    setState(() {
      print(showNum);
      if (showNum == _pass) {
        _authenticated = true;
      } else {
        _authenticated = false;
        showNum = "Incorrect Pass!";
      }
      _authenticated ? print("yes") : print("no");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Enter Password",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          showNum.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        NumericKeyboard(
          onKeyboardTap: _addPass,
        ),
        RaisedButton(
          child: Text(
            "Submit",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () => {_submitPass()},
        ),
      ],
    );
  }
}
